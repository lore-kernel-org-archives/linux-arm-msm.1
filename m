Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77B93AB262
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075467; cv=none; b=fC4OZTSc9EbmUxSDTtkMkVtrv19FF0Hwd3eXclXqQ/9AZfCcovXP7Cagq/SCq00Sqlnl3RsM+JUPua6nkSCAG6X6Fh4SrSROX7TYvvmIKKEanijtgTaxA0WlTjuTW1hB+k1Bh4Y31rdySAiEKK209SDo4FVlx+5cQx/hhHlIoLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075467; c=relaxed/simple;
	bh=aGNpXRVl8JFBMNZRTZ2Xya4znEDb2fK11nKJuDKRkVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VhAMQgpFbyJTp1+jyYK0Sn+D3on2WYogCdCKIUvKhOC9OoC5VM+3E2deWyJYCuxLCj5j9ylHpcChWMG48wz7zK3K97LiQWbLz40GHxyMaoBlDUMCl2gXfOZ5vwaKON4eIqoavpXVnRlUpTBLyw2he7iF3GhyG0XDp9WH++BKqLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TG3SKwNm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gYVzqnP6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TG3SKwNm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gYVzqnP6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jSwM2662666
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oeHaV4yMXWRHopSjV/s0dd9kK0yBuiz+g765vwpPyeQ=; b=TG3SKwNmZTBdjp8O
	O8U1Ffl85ZuMrkYqwx6Z2LZrrsgTisAX44j5XCIvIlKXQZuySrGuCMnmM/s6Y9is
	IUR8D890oFDYADLqEwBiTzIAE847/8uIH68YDet48P257H7OnPMgkKLwCubs9KE1
	+9Zrx2t/yOxuq62wWZhU+L8LXsZcg4zsanNk5gi3+y/JKRcl1HXI6D5vTCx56TMh
	jdIsGmV5HoG4BuHvV8pOHLhNsxNUR7K7fMCLzcRtJo1sx9kL7+YGhH9dxfR2aRgO
	LXAt1KHf/tJbAyOP4E3XNkdfQ7Po2EMcznJfkOBln+WZp+6Jo5Im2q83FAsJrOu6
	gOQjxg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda2kb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:44:24 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc0e22fe64so25629137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075463; x=1792680263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oeHaV4yMXWRHopSjV/s0dd9kK0yBuiz+g765vwpPyeQ=;
        b=gYVzqnP6Pbh7mIZNrREySluFSWkhge1CQXNfFTGRcYHPBqsv/MF1qy0r61xHVlHx7c
         4mQ1Nlr6XLGV5PXrJp4Fk9pZYpEhiSo18ObEURX7ZbUwDdwplkMhnEJTOtt22/wCY6ef
         cTTJlyoKFvl3YwhdBX9Zq4si0yjIah6f11Ap5h5cVFDAwe7gY95Nw84BfhvJNleH7o4c
         lsqVOCPl/eZEQXPSWvgxyjX+zJtbDkJ9+Y9Bs8DnXH0Byoiu4T2nuVEpyDG4C8FZM6RQ
         hCtgHAvc+dO4J//epRMjweKpu5rKSvyqy0nKs0Xktt2pCsmrhXISI6p10uqUPXMdqDdD
         7wCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075463; x=1792680263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oeHaV4yMXWRHopSjV/s0dd9kK0yBuiz+g765vwpPyeQ=;
        b=MBkGsoEn5CB0YAo9mEMn/BtrmHd6vzzp+i18pt3L7GrY3krGTVLnDNplMfoQS0koI6
         IIOWAle0DkCvnbbNQX8ZDebfVst1LDXU2hBi7b/Nr7Ewk2mOgd9kJ1VP+1u3KYBbfm5u
         LeX8RO8oM4E5tXGgq/opaJ80MOBWMcp+namSwOBxW6O3MvslJ9Us7iq4oaT9663+7moU
         PsPnIhSL1HSkXgg/J1otToRCBbJU41LKJUrDbyjTm012JVmfwOJYD2E+1ELW99UlR6Ol
         CNbVb8fyeRHaQRr9ig1YrMNTUbTdL3Gu29jkN0xr1cwbq7DorHRor032Bb9s36iYmWkT
         CQNw==
X-Gm-Message-State: AFq9FYJX3K8ScpZbPzx3A/ZGoTCz/VY5unsVSVfd7dOfrnxwEa7dDaTg
	ALemnIJekcivk5Nc+Q9g95qEJKb4gBOYzhG5l73PDpFIvOQUAOJxHZ2cjTlsNDvxz6smieNirEy
	7zpOffNVBl+AUwuShSScOLq58MsPf91XSQ+0iFrB31LqBDtqXVKBfBtWqWQQdKrhWInrd
X-Gm-Gg: AYBFou0BRpCtP1oQQO7PxrRkWOm1RRAS/EjxSBq4CRREEufhCktYbxibFhVylgOY/Aj
	B4pqvJZr3yUVjvv/hADFvVeKD2MG0mIGzULUIQSWGKBMKpacf6ElYkUmd3HzBzOLmCL601GO7xY
	dxz8On9jyX1Ib20V6XxipIIKDDJzKy7K8MyJCel+lvnk1arI0/8Cc9/v5Vz1R1q/AM3xngsr8+U
	jazCKnVk0Hx8E9gE1G5/OPdE0necgXS/NJQrNAA+ZJhbGD+g44lXMHSlyYipv613ZLHNze0aj3l
	lZHDjRvjDBpUP6zQbhuoWle+71EKSV1A4lE2K97DKbaXSrjVm4Yir/x228Oo0UinKvBCMxXPtV8
	PuDQ6KWbppJDCNb2h+IYntg==
X-Received: by 2002:a05:6122:8711:b0:5e6:6546:84c7 with SMTP id 71dfb90a1353d-5e91f339ea0mr4870190e0c.2.1792075463538;
        Thu, 15 Oct 2026 07:44:23 -0700 (PDT)
X-Received: by 2002:a05:6122:8711:b0:5e6:6546:84c7 with SMTP id 71dfb90a1353d-5e91f339ea0mr4870185e0c.2.1792075463093;
        Thu, 15 Oct 2026 07:44:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203839d71sm2677074a12.13.2026.10.15.07.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:44:22 -0700 (PDT)
Message-ID: <944d39ba-6e1a-46af-b5ee-32140947f924@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:44:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfXwMgSZw3Zv8ga
 d6HayGLMDewQmwudAhL89rR456x1DpH6mCRzgkjLd10TmAi3hq5A/nMu9TiGuLYtQ1m7swSl5hc
 /rmx5H29tdV4KD8sS1EfuMwTYbXOVDU=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0e6c8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mlqdXDtd7Tu8XZfzzBMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: qywZIqlqsEOjveo3Yf7R-U-VNOpAJnCF
X-Proofpoint-ORIG-GUID: qywZIqlqsEOjveo3Yf7R-U-VNOpAJnCF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX1EZxzomFvavW
 XDw321GeRPiqrMJssBVdl6Q2qv2+LXSjJG5GZKaSlszg9Xy8Nm0E9d9LdFsPQfgFvU3BmKwp9iq
 h3b7zj533rPtHrjviZAvQdVGYQdAJvuzRWB80+4MjHyzoqnrDG8mElNsJcrGzXVPVnI/TnHMvwF
 Mb7rROQ6k5KWv1qVomXIXfrN9Mu7C5vlNziw50nEtkS2KqNxr+M1vVgkzQl6nKDheqQOaWoC7VE
 +/TC0VtaK7VBVNl26ONuLiNH8SfV6Q47OF3X92sJxCwkCclWrT9600zZlwVXHmAI9hYLpMpJgjk
 o8FgeaOfbJUpeR2W1uzjbfTyFSh32WoceMb8+3ZOa8KndM6Vp6SG07WJpGOqLFUOYtErveAVle9
 hzU665at9In7gG2E4Dhp9QDcGT+DS8+pQW2I6t4hIw5CZC2jmzt0NDlUKqGofqKiSo4IX3GTZiR
 fBBI00QRVnFICJznB7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150058

On 9/29/26 11:35 PM, Elson Serrao wrote:
> The EUD hardware can support multiple High-Speed USB paths, each connected
> to different USB controllers. The current implementation uses a single
> chip-level role switch, which cannot properly handle multi-path
> configurations where each path needs independent role management. Since
> EUD is physically present between the USB connector and the controller,
> it should also relay the role change requests from the connector.
> 
> Restructure the driver to support per-path role switches and remove the
> chip-level role switch. Additionally, as EUD need not modify the USB
> role upon enabling, remove the unnecessary role switch call from
> enable_eud().
> 
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

[...]

> -static void eud_role_switch_release(void *data)
> +static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
>  {
> -	struct eud_chip *chip = data;
> +	struct eud_path *path = usb_role_switch_get_drvdata(sw);
> +	int ret;
> +
> +	/* curr_role tracks the role from EUD's point of view */
> +	path->curr_role = role;

This should be assigned after the fallible call below

Konrad

> +
> +	/* Forward the role request to the USB controller */
> +	ret = usb_role_switch_set_role(path->controller_sw, role);
> +	if (ret) {
> +		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
> +			usb_role_string(role), path->num, ret);
> +		return ret;
> +	}
>  
> -	usb_role_switch_put(chip->role_sw);
> +	return 0;
> +}
> +
> +static void eud_path_role_switch_release(void *data)
> +{
> +	struct eud_path *path = data;
> +
> +	usb_role_switch_unregister(path->eud_sw);
> +	usb_role_switch_put(path->controller_sw);
> +	of_node_put(path->np);
>  }
>  
>  static int eud_init_path(struct eud_chip *chip, struct device_node *np)
>  {
> +	struct usb_role_switch_desc role_sw_desc = {NULL};
> +	struct usb_role_switch *sw;
>  	struct device_node *controller_node;
>  	struct eud_path *path;
> +	const char *dr_mode = "";
>  	u32 path_num;
>  	int ret;
>  
> @@ -328,14 +359,61 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
>  				     "failed to get controller node for path %u\n", path_num);
>  
>  	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
> -	of_node_put(controller_node);
> -
> -	if (IS_ERR(path->phy))
> +	if (IS_ERR(path->phy)) {
> +		of_node_put(controller_node);
>  		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
>  				     "failed to get PHY for path %d\n", path_num);
> +	}
>  
>  	chip->paths[path_num] = path;
>  
> +	of_property_read_string(controller_node, "dr_mode", &dr_mode);
> +
> +	/* No role switch needed for fixed role controllers */
> +	if (!strcmp(dr_mode, "host")) {
> +		path->curr_role = USB_ROLE_HOST;
> +		of_node_put(controller_node);
> +		return 0;
> +	}
> +
> +	if (!strcmp(dr_mode, "peripheral")) {
> +		path->curr_role = USB_ROLE_DEVICE;
> +		of_node_put(controller_node);
> +		return 0;
> +	}
> +
> +	path->curr_role = USB_ROLE_NONE;
> +
> +	sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
> +	if (!sw) {
> +		of_node_put(controller_node);
> +		return dev_err_probe(chip->dev, -EPROBE_DEFER,
> +				     "Failed to get controller role switch for path %d\n",
> +				     path_num);
> +	}
> +	path->controller_sw = sw;
> +
> +	of_node_put(controller_node);
> +
> +	path->np = of_node_get(np);
> +	role_sw_desc.fwnode = of_fwnode_handle(path->np);
> +	role_sw_desc.set = eud_role_switch_set;
> +	role_sw_desc.driver_data = path;
> +	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
> +	role_sw_desc.name = path->name;
> +
> +	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
> +	if (IS_ERR(path->eud_sw)) {
> +		usb_role_switch_put(path->controller_sw);
> +		of_node_put(path->np);
> +		return dev_err_probe(chip->dev, PTR_ERR(path->eud_sw),
> +				     "Failed to register EUD role switch for path %d\n", path_num);
> +	}
> +
> +	ret = devm_add_action_or_reset(chip->dev, eud_path_role_switch_release, path);
> +	if (ret)
> +		return ret;
> +
>  	return 0;
>  }
>  
> @@ -352,15 +430,6 @@ static int eud_probe(struct platform_device *pdev)
>  
>  	chip->dev = &pdev->dev;
>  
> -	chip->role_sw = usb_role_switch_get(&pdev->dev);
> -	if (IS_ERR(chip->role_sw))
> -		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
> -					"failed to get role switch\n");
> -
> -	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
> -	if (ret)
> -		return ret;
> -
>  	chip->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(chip->base))
>  		return PTR_ERR(chip->base);
