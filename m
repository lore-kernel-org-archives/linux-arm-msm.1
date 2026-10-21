Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583408;
	b=PZJBHqQv/OJ7+2jUIlQktAqnhpxB1wW6pUnNQaxL+TXL2oMDUU4uz4TqD56o1quxubnG
	 sj5HLct+YUaowVUfxgFyuR5WuggWAkcADFDoFOhRfKVf8FwerYDqwvu7t0tHc9A9wyb0G
	 teF/I/wCePMQEAdTjm5lEc1hBbCkLmEv1q4/ffzpLRC4JCBZN4bro0x8Ku2/VEYoT5vwW
	 oWKAxfcAhPgbkt5B0Rs8ucfEVxCsYbfTL064B66uXj932IIHM9DSSMudI/ff+56xyec6P
	 MMefgGuSRmhbbDxaI53Fe9A7AAWqKpway6lP4wFJOw0ihdPDqigoFK5ho5UibUZGTAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583408;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zN1YohgORCrsb0fgBq/M+QsSb1XehQmuOvn33cCPAMQ=;
	b=yC8eKs/ADedICUlMwkxCY2VayODSFgyCLPg3uCgHcwXcqh4A1D0wehcSwfjt9ZESTf1P
	 ONVkyrmM6D2Oods4V1PcyXVgqpoLiMrb7duYr3c1MR2REVaUOJiaeI0WZbWoDnL5jDBLY
	 9dJwPUizbFQzDlfw8f+2SLVee6qUchMJsmdiYhAfu7jSW1HPo1OI5tSzkrLdDUrXTggPa
	 m5FcDbNLY21Tq+EPaULkkqc4aXcpGUqyMyCIAVzrCE0nm/93YWOn9XPpJieTrDK/aq876
	 CmR4dG8O+piJ94JGLg4/05G+ZM4h5yBHA2YWQNT69sjZ2Uk+LwfKhFPsvo33+rWyreg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VDmc+9gw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ag6kFi/r";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B43606A322
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B43606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VDmc+9gw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ag6kFi/r
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgLDu4168136
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zN1YohgORCrsb0fgBq/M+QsSb1XehQmuOvn33cCPAMQ=; b=VDmc+9gw3DniNvuO
	2lW/B3oKKlHuKI4Ufs6M2TR7k7LU1M+miaNBgx6XnXR6/Zr3UWGkb0kneLW8sX6n
	20OdYfWpPsNbLVYCVuQUEpTjTBj30klEipO/hkcP+mxohAjgX1IvQKLQuxIeAziy
	fCi5M8nxciyNhiB4JeeaFJK0IBNBThztQe/VrRsYJBWkreVYn6JLwVflBpoQam6P
	Qr5u5htd832GQUMTDrzvjfH0PQTi2QrIAcsO2H/Ww3wkdLMYClzCek/UlIRaH08S
	aL2nU7ddrwNZNupa2mAw6LbWHeWxWiOlz3lq6HvMi5O8R2TUt/Y3XRNcltsss8Q8
	4/6AAw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0kqee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:50:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so1647292eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583407; x=1793188207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zN1YohgORCrsb0fgBq/M+QsSb1XehQmuOvn33cCPAMQ=;
        b=ag6kFi/rTNHqnRqesYyFGVzkruuowcdPSeFWTLGF4KUqKABzCixnuQPP5T4R/aa38k
         lLJh/KMDKq8zfSt3V5/BFrppJjsk/l6aembEpUNv/mABOak+ZQVMdh32FDe/TrKjD/RG
         SIIV7Fa3rhiDfm/T73n8Qy9sCdo+ciVzTXIbRKAYiJ8z97GMekMsZzWUQ1Wx0PRA1C+s
         zB84HVfHgTAydUls5CyXBFuRZaW/dfAoK1zEW2NNzmcxNqcEaeVdUO8C7z4e68XmL1WS
         uZ7qxUL7yXof3oYU9Q4ZOSEKuG3zPcvU9ox63MpOGtydtd7rsmMfgVa1WZlIw66KWSAV
         AsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583407; x=1793188207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zN1YohgORCrsb0fgBq/M+QsSb1XehQmuOvn33cCPAMQ=;
        b=BD9qR8HLmmy8bhP2s7mH180xC60/vKRes8n7rzFrZdtSjdD5kNFjONM1JAlzUJfJHV
         Kw9L5hjiC9WRYeetH9B2NGwqjcDa5pW+qUq7dvLTE5gc5tFLJpHeLpyqMPU3dk83plp0
         krRega8LiHqyUUDPsEKb0Dj8hQSbLBwbx/ngutjlJOq5pS38dqEEXKfBnblEfaGMLuOI
         MQcfWTQTIjrf/iN2fHJ/H3iGoLHRgkcf6NcIHeyKq9HAw+yhJd8OjHPuAmt9OMt+Mp/t
         zx+DqIl4cUa/+9PzTFOTzXvRYhUGhSTxZtirn0NmDHT2ZMnqTgP8JiUIaQjp8Dg59CgZ
         +EEA==
X-Forwarded-Encrypted: i=1; AKwUvByzhwjTKpgLb+opAFcmMQ4heJf1KuCwfQ7ycC+X55p/kJYxRZpjI1nAicfr7uk6s+sByAKOxjzThhXyA+Nu@vger.kernel.org
X-Gm-Message-State: AFq9FYIGZIbjfussQBOQvap7WBdb9TTjPyeqFdKej/qk/KnmwddXbsbW
	TqyUos1DMXLkooDfJ4QA3ayWx6TC6LlOGiK6IYfHXa0vGRI+6mmoD6ocx1SF2367l+d/QERt6fa
	Iek+EI0qbRbj0s9+vg9GF2jbiXl3nZj6XxUSgnU9Liwz+VxBHmptNidxf+6DWKtWnNTo4
X-Gm-Gg: AYBFou2HcFVCv/Z8mgw1zIAS9us++kqD1qEZDuOJ00c8ry0/3d1WmhZlnsV28qGrsJn
	qsvV+EO3V88FQspRcJcZ/c6QtPeQaF4o4yLl1Sh5JpVeHQczbr2iG+PyVC//DFcy1aYx5qfhQJD
	VWjP8IBGhr3eN3a3AicMXgqhcwypDORQ2Pc/y/5v/LQkQBtnyYleixJ3GHn7DEh6RePtfrV28nm
	znwbfB0g582nSxJW2LwzRWyA0eLNX1IbQBAj+7d+y04hVrBTCOfCiltW7O2NruEfkTwNVn+vYdE
	CWFPvFLOY7VHxbm2BIkGzaFHBOdlVLdmF1PA3vOKNieO+hWSLYHtgErBkoaSQ6DrRd0ZXRy729V
	AuxdKMRgTWdxiwOmCGL5wNWSfHWZ7kzat
X-Received: by 2002:a05:693c:4144:20b0:35a:22a4:132 with SMTP id 5a478bee46e88-3674ee2789cmr3293054eec.34.1792583407084;
        Wed, 21 Oct 2026 04:50:07 -0700 (PDT)
X-Received: by 2002:a05:693c:4144:20b0:35a:22a4:132 with SMTP id 5a478bee46e88-3674ee2789cmr3293015eec.34.1792583406512;
        Wed, 21 Oct 2026 04:50:06 -0700 (PDT)
Received: from [10.217.240.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ed2absm8043559eec.5.2026.10.21.04.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:50:06 -0700 (PDT)
Message-ID: <8b470cbe-d06b-46ea-b928-bbf7dc1c158b@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:19:59 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: qcom: llcc: add LCP/SRP DDR DRAM ECC register
 offsets
To: Jonathan Cameron <jic23@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-2-aba3cfcfbac9@oss.qualcomm.com>
 <20261016182014.7d2d8bbe@jic23-hlaptop>
Content-Language: en-US
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
In-Reply-To: <20261016182014.7d2d8bbe@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX8KKH5ZmxUqIl
 nM/2ycPjXg2f696WDd6MgZlOueZGBq4zg289PaoAvFtQELMb3mbYmHX0HaoIUxjfRrQ+lqlhbaY
 IoJ2buOwU0AgHJ/3MjHtjZ+hpnOARQ+VoyiUwpJwtSQY71vkV41CocRX6zHwRIB+LtPbRHBHoHd
 X2BJWwtTLooL5DjJGbsb2p3vrEMTXG7f5354b1qWF+QvvSZi4nxCmNb93uOZxe3lv0c948K8+uK
 8QRRob8xZ7b3QRIKAIeDXnue19FYcmPNnt3gkZDYUZZUzE9qIV9PQyjci+juJFL+IbarYCnGjWB
 I0ARl/iFedv0GTmMRLPjd/8TOGAIs60uFEWh1AwFzgNmYM46psSRD4jiD8G7b0F5/kqKxw0UJi0
 enodeQG+xZ6r5yjjoNGLRt+uTTImVBsQTuiHUGNaHOUQ24b3UmkkmlTlLuj6kciy+9dwgBLLYVq
 YNhUTnMBhDQdvuu3ZPg==
X-Proofpoint-ORIG-GUID: e1JM_wZL-gnatZmojvGDKtVyTfxhMeGL
X-Proofpoint-GUID: e1JM_wZL-gnatZmojvGDKtVyTfxhMeGL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfXzHED9geGibtu
 ihn5PklvQV6JFOL1ZP2+csi/2L7/pieGXVG69icqVyL+ZOFGFBHN+no4bnzIrNweBSMaQrZ0JKh
 16lzqaBOznQ8GENaX1GTRDRw4kd/VyI=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8a6ef cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yu8sOhoR8PlAKUki7sMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210047



On 16-10-2026 22:50, Jonathan Cameron wrote:
> On Wed, 14 Oct 2026 21:26:17 +0530
> Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com> wrote:
> 
>> Add LCP/SRP ECC register offsets to struct llcc_edac_reg_offset and
>> create llcc_lcp_srp_edac_reg_offset for QCM2390, leaving the shared
>> llcc_v2_1_edac_reg_offset table unchanged. Switch shikra_cfg to the
>> new table so other platforms with the same block can reuse it.
>>
>> Add lcp_irq to struct llcc_drv_data and retrieve the optional second
>> interrupt in qcom_llcc_probe(), propagating non-absence errors so the
>> driver defers correctly.
>>
>> Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
> Hi Faiyaz,
> 
> One comment on existing code + a suggestion to tidy the new stuff
> up a little.
> 
> That global for drv_data is less than ideal, but given you are touching
> the driver please tidy up initial assignment to use INIT_ERR_PTR()
> 
> 
Hi Jonathan,

Done.
>>  static const struct llcc_edac_reg_offset llcc_v6_edac_reg_offset = {
>>  	.trp_ecc_error_status0 = 0x47448,
>>  	.trp_ecc_error_status1 = 0x47450,
>> @@ -4767,7 +4802,7 @@ static const struct qcom_llcc_config shikra_cfg[] = {
>>  		.sct_data	= shikra_data,
>>  		.size		= ARRAY_SIZE(shikra_data),
>>  		.reg_offset	= llcc_v2_1_reg_offset,
>> -		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
>> +		.edac_reg_offset = &llcc_lcp_srp_edac_reg_offset,
>>  		.irq_configured = true,
>>  	},
>>  };
>> @@ -5798,7 +5833,13 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>>  	if (drv_data->ecc_irq < 0 && drv_data->ecc_irq != -ENXIO)
>>  		return dev_err_probe(&pdev->dev, drv_data->ecc_irq,
>>  				     "failed to get IRQ resource\n");
> 
> Unrelated to your patch, but why don't we need that tiny bit of error cleanup under
> goto err for this path?  That use of a global is not the best anyway, but none
> the less I'd expect either some consistency or a comment on why not in the above
> path.
> 
Good point — changed lcp_irq to use return dev_err_probe() to be
consistent with the adjacent ecc_irq path.

>> -
>> +	if (cfg->edac_reg_offset && cfg->edac_reg_offset->lcp_srp_interrupt_enable) {
>> +		drv_data->lcp_irq = platform_get_irq_optional(pdev, 1);
>> +		if (drv_data->lcp_irq < 0 && drv_data->lcp_irq != -ENXIO) {
>> +			ret = drv_data->lcp_irq;
>> +			goto err;
>> +		}
> 
> Maybe it's local style, but generally I'd put the value in ret until you've checked validty
> then copy it to the good location.
> 
> 		ret = platform_get_irq_optional(pdev, 1);
> 		if (ret < 0 && ret != -ENXIO)
> 			goto err;
> 		drv_data->lcp_irq = ret;
> Both more compact and obvious when we trust the value to be good.
> 
> 	
Agreed, restructured accordingly. Will repost as v2.
	
>> +	}
>>  	drv_data->edac_reg_offset = cfg->edac_reg_offset;
>>  	drv_data->ecc_irq_configured = cfg->irq_configured;
>>  	drv_data->dev = dev;
> 

Thanks & regards,
Mohammed Faiyaz
