Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850C62A1BF
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 07:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786518247; cv=none; b=h+uMKay6pCt/g/rXqyEOBS1Acxar0Zj2bsTsOMr6DRX8WvTtWYfcdMCOGPreRQseiy7ruihfpO446LPnz3pwLKGg4FbjXq3/hUrHiGQ2sf37e1anJMHeWRT2MFsZbQbswu9t1EWeUpiIsnx/U72Kro4EMPu1sFZdCGKV8+8tqJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786518247; c=relaxed/simple;
	bh=FfN0nJx8Dul8XdEWQBMUqwCzVU0xcVSQ8v0QjHtVDjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NqZYlLvMHcExYVywjdXejAV0P4p0xJ/Uf3+yxXChOt+kfx5Dc9YiNz2O/5AxkHpyItwXgn3l3NpkxpkHMq9ybxdA97Tpu/VVPEBRjgRhsDPKX0izg0r3IUT+ZPG7HKrMB++/oxvahMrWodmQbK6HHie5Z0u8ngg6eDQUNiy39q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/kc4tNR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWx1flTc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/kc4tNR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWx1flTc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62YHc1720471
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 07:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2DhVelqeFqlM7W2oGUB/BgJ5iSIedICiAX5U83IyemI=; b=o/kc4tNROW/9CdNY
	7BTb9fhVuvMo7QjsPpuGrgdnUMRCWI/O3iJNSgiK3UANjvGrSWsZ3XZqE2k3hPI2
	UoYifF1igAnveyO9K/DYYCsRLrjR+u+exBTh7LF+jOwW7kKgu59mQLH7rKj1IHAH
	QfsK5vXXQ73AmtU0LE6PfG/NABrN2bReMk3yLpkQOOvMItneZ39xill8EVWWnDlM
	L3Qw5oaiIAj+0golvv0lvXh1PN3X5rCX2a/kwOSnbCJM1zEouEPEFryHmEdhl2v0
	DVWczGw5tmtd2URtFHepCp/55JFO6s/uSrSI/VvBvD2OTkMFuHj1lnaWaS4memM4
	iL7zMA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hfw0ksq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 07:04:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso910439a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 00:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786518244; x=1787123044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2DhVelqeFqlM7W2oGUB/BgJ5iSIedICiAX5U83IyemI=;
        b=UWx1flTcH83n67mpVcpzSBh6OpQ2Eclnxa418mF9rAi9o/OSJ9KXwrjsSzNWB5fMqf
         VXNRoDxoI7TxV48MO1/7IfyW5ZEU/OH4p1anCyzcWc9oKHpQaQu4T3mOmlIXZzqu4O4n
         Q0c40NNJOU4bKu29iODvGruQMP74xCJTiHyQPsBbgDNDLmiO7C7gGgbbwnJTUwFXrDDs
         0Sgmhviv4Di/ptik5w7ckyINUJQ/1vJZNDd2Qk2ffDKgdvr38KNP8ECVel5F8CwET0de
         pywqG0Hm3AQVWRewuovcU1aJbXcSZBvRZa2je11UpHy6btBJ00u742xbjTOy3ZAjj24v
         pnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786518244; x=1787123044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2DhVelqeFqlM7W2oGUB/BgJ5iSIedICiAX5U83IyemI=;
        b=NhuDgRgm9ifhL+qrxIC1+bA8ZRRV0JCMraKtJ+k/EkpJ6LzQEJIeyOmJrvNB/t1B/X
         JGK+yTtk72yfrnZrXw5aJPDRkgohZoq/Yt3nROF6w/jb0sFhIig6biF6ipczHzvekmF3
         DlkdyJhai+7OQdAN2t5ABEKUBIMy4Mody1OenwyipCRwTwy7YjRxHFmsqG5hSCZOPGe2
         Z5JTS/REylRPxLZtgIF+N4/1V3v8XHXLs4llKvOzG63n3nxg3XD2g2waDRgV4+L2UfvF
         OMRu4M7wnCVzCRZf89hGYwkD4cvz2PTru+JAwdtHdg/UATEgn3MmS1sjcNyoQZP5Fu7n
         4OJg==
X-Gm-Message-State: AOJu0YyLG6/s3TuMwpsZkHjF0m6DBx6LNXzgqc7yB71NRXSZkaK/4Z1y
	cCrFUCOBt0Hs7w4q/RajkiYzjSTVUTTfyks5y1+u9Jo/P/bjEccVJT+DoilFtbnsshGltWcSLZa
	a2EkZuLAD2Di0BL7l0CUl1NBPNMnqJNSoMPxRv7cqZ61HQXWLHklsKb02EWgGhlp15LJYmA9K/7
	6zZ/8=
X-Gm-Gg: AR+sD13+Jq/EJEkxxpuTK3TPcJUoevsOvoHHAFfOzJ77gpEYZbeohlYVVdiWor0T9ti
	84E8+A5YlYBSUxTAEdmNGXQ1H8GOcawpMmGkaUo7yLm05CVmLBosHJxJUz75qiWUft80Zp8eu8D
	5+LzRLxR9L4RxLck1W/bviGOcKY7yvUvwJfk5y/K0WEt/3J9vPP7WV9tznqKcFLePmnvh1xB8RM
	eefmrRjkTavRbEdLtEiWJNT+dNW6BM5wAXDQ/F4RzsWov2Bc3A1gmEuN17fOP2qs9ar9rCfywY4
	+szEI0kjp2Hr8DgWbe/dOX+hwKDcTjWMZYu+QDCtfiVqkNb2Mu6dbIAeDwalXlap4UME3gYg/TZ
	HSJlbi3UVYQimzoBxp/2JFUW5Y0gZaNkNEpmNyWqO9umZqr3muLTksG3U25Rqo2thd0Fy6jY=
X-Received: by 2002:a17:90b:2b45:b0:380:873:49cb with SMTP id 98e67ed59e1d1-39301834f69mr3314496a91.21.1786518244200;
        Wed, 12 Aug 2026 00:04:04 -0700 (PDT)
X-Received: by 2002:a17:90b:2b45:b0:380:873:49cb with SMTP id 98e67ed59e1d1-39301834f69mr3314420a91.21.1786518243681;
        Wed, 12 Aug 2026 00:04:03 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d35222e1cbsm2309975ad.72.2026.08.12.00.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 00:04:01 -0700 (PDT)
Message-ID: <87c2e82d-1615-410c-b188-aeccef66baca@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 15:03:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] dt-bindings: mmc: sdhci-msm: Document the Maili
 compatible
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>, krzk+dt@kernel.org,
        robh@kernel.org, ulfh@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260720215645.1464901-1-nitin.rawat@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260720215645.1464901-1-nitin.rawat@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA1NCBTYWx0ZWRfXyxSmyvuIBn5i
 KRoKYnzXYdB6vTubqfBmE8XzIt6HyLOhcQqwURyAnbod2UlKiM/mKrx7otwhk3ia2LvR0fEVIwL
 z1WN5sspvP95g7sYqooXiOOBqrIL3PA=
X-Proofpoint-GUID: LTXCeABPdpCkOyWnPMtL8w8g9uW5lmJ0
X-Authority-Analysis: v=2.4 cv=fpDsol4f c=1 sm=1 tr=0 ts=6a7c1ae5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=P79rZLnGM28BRmGcN3QA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: LTXCeABPdpCkOyWnPMtL8w8g9uW5lmJ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA1NCBTYWx0ZWRfX5KDM5BQLWTD9
 8rpCEdfDgZxb7x7ZIp0YByoeqUhPzruBaXqw9sfHeZcUwuKXmTHPYmO29Hqm6Xsz1HUbjchHq5i
 wyo8FHmFOLf0t2koxcD+tzM+0/E/Iv4XUk3+H21Aep2h2VDpNjArEwfOBe71c/5gLm9k1iAzciT
 NCBDG4QAk0Ao/TCQx4CywPSxKtcnzJ2UW3NcNA17Qb9s11nmAHDZoA1nnw0EiisAP14ibEw5iON
 zghn1MlraHtnSNC3gW0UnOUiNVoMBmSNiqvO/JK2on89yUnf9hs3sIjiXPscyCFwGCH85UNI20K
 lxU66dw8ZfGVmoAkoLM5orTSOHOJz39To9y9/+JM+vmBPgU8dddsWhgehJ/qJyopK3YkI06KhxP
 BxkT6GVdig30vUoCuYxPP7lynIoM8gUhPy+2uxiOn9ZsaGgZvZUFiTZfhxkDmpJ+mARZPP9PECW
 OX1d/WC4T3WWZi5SUcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120054



On 7/21/2026 5:56 AM, Nitin Rawat wrote:
> Document the compatible for SDHCI on Qualcomm Maili SoC.
> 
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> index bd558a11b792..8dfcd1351551 100644
> --- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> @@ -47,6 +47,7 @@ properties:
>                 - qcom,ipq9574-sdhci
>                 - qcom,ipq9650-sdhci
>                 - qcom,kaanapali-sdhci
> +              - qcom,maili-sdhci
>                 - qcom,milos-sdhci
>                 - qcom,qcm2290-sdhci
>                 - qcom,qcs404-sdhci
> --
> 2.34.1
> 
> 

Reviewed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Thanks,
Jingyi




