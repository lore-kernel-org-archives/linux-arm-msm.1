Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CAE3EE1F8
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371999; cv=none; b=lgeUXK1zt16IWBX+IL+kgL+L5ythl7Rl0Vh3hI3t0dEOkdU/bFGcU9xsWxTbPHlDaLQm6kSKIyMDtSBgrB0JYBSV/TbrxDiA1fSsTT+bdRE4mUie4cGiNFHT1XQGAh88hT5txb9LMs1CVGSnl4Pso3cJry6ZFQRKWQ7jFa1MLGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371999; c=relaxed/simple;
	bh=ce1O4pelLhDjVlJPpZ7LGe76uCma3HUAKQ1dHmclyB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZ5fEsvAV/CdKeDU4eCvYaWu7cVs+lqpNUsyRgWWMhS39I30352eHhD/E1cP187Ba0KEDuk9z/6bvEkyJs25SlP4Rcl3yJB/r+AYip0T+ezsea6zzPesAfI+9FMbsbh9YThaG2WFaNgQKAF0scA0vUlQ1EDcVb5yZ6M0WFy5bkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HkZTQ6Ko; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGtX7UOu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HkZTQ6Ko";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGtX7UOu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jPaS3842778
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FtkXZcX3eCc2fMQ+ziqCcCeR
	Nzu7i+LM1BaMpHPINhM=; b=HkZTQ6Ko2WMUAGjXUdpjHw8socpUkrDnHVs0xogo
	6MY+t/IrFe4XbsEV0jLD9pu+XHII+jn4cMgC/9Zvda6awrPTU/+PYRfPt7CjF8ZJ
	2RmwJ0a6RD59cOZjRynA21GiCmmk+kpt/PGDBMZr6s7Yz0tvvu+xOTJ215yE41a8
	eD6zgTHhx5DLnXI+iQPBMI+un/nvJMfjDd8SJz8MwMOzwHLobQ7+d651EvKYrd5C
	N7HpJqoGK8vS1t6934paMx9spwtQXFA4SUVJLSLOKynxtEKjtGYV6acs3hdH5zUk
	0AGb7bN4JG8XjKrEqm7MohKxjhmBPKWX7gFWKf3dizNsHA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5ke4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:46:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1d44c437so121554085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371996; x=1789976796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FtkXZcX3eCc2fMQ+ziqCcCeRNzu7i+LM1BaMpHPINhM=;
        b=aGtX7UOuEMI35SoVmYLtHhMO1A9N2e6CmSceXsUJ+3UCEnnaOC4pyIMt0mS4cng4Nd
         AtIIj5fDooT7fUrX0Pe7L0eV1gCwB9s59wnm+Pu43xc/CeZ8IPUANxEmcuemsuaFOMqP
         43gEtVAu/5Ti9Ry94Y6UWlI27lMnwoue1Q7Fvvrf3o7tE3rT38f/31vGedVznqEu5qLF
         zjsyoL3Ti+lR8B+7oXY1YJmpOCaBZXmp0ncDZv1ZW/hNLssbFcUDMOw7MypuJKUMluKo
         wt7tTDgCBH2hqdn50AcqNESM74UnhY/cYGIiydDt1srH2aDNF9n1B16DNfFA86w4fLYa
         sgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371996; x=1789976796;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FtkXZcX3eCc2fMQ+ziqCcCeRNzu7i+LM1BaMpHPINhM=;
        b=NjLbmMi+p04ZJ+Sv6z1ACwmcffxSptKxnAjbJvkSdhbNQq0xYVYkd+f8tOCHKswsTr
         1HltoQaxflaqC+wWrO4UdJccpluTLn0yJYhcnsG8ZBaBiafWmOwT7LmhRPnGn2Ej4nyp
         HyOfxOT4S1q3HtuLXNX8155Y8mFJlI+xxXF5vgJOk4f5DqLHw0thM7fKFwKtXiphYrl8
         9eyFzjdj8yh+PAaMwkNO11m4ed9k0FhdeU0oJmaDYQLaH4k8LQtyo96Bb1ImfpbEAGO4
         mzarIc1KpcKIgY3FyoC36027wBNv19G178I/giUljZGxWYdkHuQc9sHvZFZk6yNvmzQ5
         64Vg==
X-Forwarded-Encrypted: i=1; AKwUvBxvfT/DJxUaAYxJjl2LT+88BHTtcShogxsce85Kc+8VODIMRmmePccb0RN8r99E8uYFnfZlrkczKAmTr0s6@vger.kernel.org
X-Gm-Message-State: AFuF++m/T3F6uk/R/HkEInQsK6FonZs0spXfSlWHvG1vz6F3FhWqI9td
	Eubnlyt9MnI2NB2bOEH3B/JTs5VwrixOdgTSvDIMGVSEsTTlK1c3PI3DsAPuUTxKS/bvX3Autd2
	mxCgZITF4bB3gh3SkYlaxZfclp2VAe7jOMbJy3Uhw+JOO+6sGsM4snZ8Sdlm1GDfUHRG/
X-Gm-Gg: AYBFou0pKU0teqcRPujfe85fdRDwOLyMMH6ZnF4bZ9L5me+HzOWYRkTwR4LNaj1y/8p
	VduYPWwcYZYaVtiz6+6vppOaUz0KVLHsPfEiV24+1uNTHt695UQYyNgptqCqpKB5wAmvp1Avh4e
	Xhvf3r6EyG6pdHcReRJliEN64oVKK9/H12yoFA8WZPdCtSLJO0fhviVOctY809kDvywfKrodjxV
	sgmwrX9Xy2v2a3SWp09g4c3HTE7skqclEckT+HQvOiotWUToYJmvZPpG2SIFPyfavv+LTp9YXZB
	24kJyOGMXXzQ1Nh3lWEZH3Z5oy+jetDFniGxRL6gPdUK8qMPaii9VzWifgngxggmKBN+e3AC5s6
	KfMbO9ys6MJoQdkU=
X-Received: by 2002:a05:620a:6f01:b0:939:c898:ce3f with SMTP id af79cd13be357-93a297e8f80mr202259985a.14.1789371996116;
        Mon, 14 Sep 2026 00:46:36 -0700 (PDT)
X-Received: by 2002:a05:620a:6f01:b0:939:c898:ce3f with SMTP id af79cd13be357-93a297e8f80mr202236985a.14.1789371990860;
        Mon, 14 Sep 2026 00:46:30 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bed0sm25587273f8f.32.2026.09.14.00.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:46:29 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:46:28 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] interconnect: qcom: Make important drivers default
Message-ID: <npsrkq442luhxv3sfwjoojzfnnv4y4knsplnfucgdwj6df6uar@gjmbzv7yyldv>
References: <20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com>
 <20260914-interconnect-qcom-clean-arm64-v4-1-5b2c0e6a929a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-interconnect-qcom-clean-arm64-v4-1-5b2c0e6a929a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Y3WsT1pysxVJM0doI5sic6x5RWYFf5nO
X-Proofpoint-GUID: Y3WsT1pysxVJM0doI5sic6x5RWYFf5nO
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7a65c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nOPaym-2Fu4dxh1hCxsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX67+li3XmJXTO
 KRN8mLYZj0llMa9Zefio4dxo1H/XlsnyZfSJvUZQxdwTt1OhDVegQwxypJeYspOcm0PMQmdHXO3
 aoS1HPfpDDiGiaZWJGoydjkULicyabiseUbK1F2UFIbPWtqPmJE2LdfXRMsnmIMpnyvx431COYh
 nSw6I0JxyV3M5k3SydWgvZ2xRd9OVCBrZYGdI8wlotcXcA0wTorQJjivRhKD7IbDd9FXcjX+Qx4
 pBr0ivkdtY2utUO+N4ck+c1jXSntg2FoBZVB/q8rj7nQFOan3ynDuA3NK/KMJrHObRG9r/AZl3M
 L4Ew9ZQCKRWKxGe/W+FF+nn9HOI2vrZYzuIVPu4r5p+R5gxNdrwXDUXz6pz3fdcKbnR/F50Icpb
 vM+Vq0X0706kFrPS5lXsPPIU1wzTaX8ZYVACUiokH7580SIpUuqKAi5Up6qTanbewjd5PM4oKSA
 fTFFBlyJs2R8BrnLLlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX3YlfEN2asJkC
 1j9ShMFzAcMsgM6f/yCooV26UXbf/B1Cs7Lp7IHXbYQwb7E3DV86+0gHoto1uazOjzvHs9pQo2g
 hyeRiZtJJvh0SdyuMfmpolqHMqsC9Rk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140109

On 26-09-14 08:44:04, Krzysztof Kozlowski wrote:
> The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
> basic or fundamental SoC feature: bandwidth management between internal
> SoC blocks.  SoC can boot without these, but power management or
> performance will be affected.  These drivers do not represent any sort
> of buses visible to the board designers/configurators, thus they should
> be always enabled, regardless how SoC is used in the final board.
> 
> Kernel configuration should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
> 
> Switch all almost Qualcomm interconnect drivers to a default 'yes' for
> ARCH_QCOM.  This has impact:
> 
> 1. arm64 defconfig:
>    a. Enable as built-in INTERCONNECT_QCOM_HAWI, INTERCONNECT_QCOM_NORD,
>       INTERCONNECT_QCOM_SHIKRA, INTERCONNECT_QCOM_SDM660,
>       INTERCONNECT_QCOM_SDM670, INTERCONNECT_QCOM_SM7150 and
>       INTERCONNECT_QCOM_SAR2130P, which were not selected before but
>       should be, because these platforms need them anyway for proper
>       functioning.
> 
>    b. Switch to built-in from a module INTERCONNECT_QCOM_QCS404 and
>       INTERCONNECT_QCOM_MSM8916, which as modules would not make the
>       platform bootable in most cases, and INTERCONNECT_QCOM_OSM_L3,
>       which when module might slow down boot considerably by having
>       caches running at slow speed.
> 
> 2. arm qcom_defconfig: Switch to built-in from a module
>    INTERCONNECT_QCOM_RPMH, INTERCONNECT_QCOM_SMD_RPM,
>    INTERCONNECT_QCOM_BCM_VOTER, INTERCONNECT_QCOM_MSM8974,
>    INTERCONNECT_QCOM_SDX55, which as modules would not make the
>    platform bootable in most cases.
> 
> 3. arm multi_v7 defconfig: Enable drivers necessary to boot
>    ARM 32-bit platforms, which are already enabled on qcom_defconfig:
> 
>    a. Enable as built-in INTERCONNECT_QCOM_MSM8974.
>    b. Enable as modules (other dependencies prevent from built-in)
>       INTERCONNECT_QCOM_RPMH, INTERCONNECT_QCOM_BCM_VOTER and
>       INTERCONNECT_QCOM_SDX55.
> 
> 4. COMPILE_TEST builds: Enable by default all drivers for arm or arm64
>    builds, whenever ARCH_QCOM is selected.  This has impact on build
>    time and feels logical, because if one selects ARCH_QCOM then
>    probably by default wants to build test it entirely.  Kernels with
>    COMPILE_TEST are not supposed to be used for booting.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
