Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD7142F71B
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223634; cv=none; b=m/ZCh0sWvN7V1VzL09Tsrtm8qhSYSvN5cLb0mMPtit6QnQFkobMC6Vo6kOrnv7eLUNWxGL4FiThY4YyGxQvUK6ib8UdeXJpzWGWNzf8WPT3+txMZH2O+rU+2+NucdsbPUVo4x22ZCg6RiDiu9td/LiZ4kkLKd4wBOwewi5QS1Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223634; c=relaxed/simple;
	bh=1nkgnT2B++owgxduCL1oDJqpAxkr1BU5In1f/pHzGyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aAmPu/mv0NK8az24PkHMJwiVrGHL4vVV0zt07qlUneGY7WmP+Nax4f6DHSL/qDrCudnD7EfsVpnKPl6VCr1JhvnQ+53jslRzt/ufFL0ftHqyTJBvtIWChZELe9Izqymj48ZUvcs4W+uvpRBpPLLyJpP7eHS0S9ZG91kRduXrXR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJgv9a56; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IFq4xjWj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJgv9a56";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IFq4xjWj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSl4o3171771
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MfJShcmfLryO6WYoQaq8ODwaVGBiMme33GaRaClN7sQ=; b=YJgv9a56qUE2HW6U
	qGsjpNRN3U+Awc6361nbOq5bvdQLJaPOrzc1E9bXVQgc0epfcGmHHgXGCqqfIZDN
	FiZOn/LenmxjhxS+Row5tf7DSj+tsQZeaICWqfeEsNmxJhmtVqx1gNmPQn6fXLMM
	kc23etnqBQJy91SXI4TTb3xD8+JdeUbZskxLH/zMMDCApSLAIORL/2VRGB6KBUr7
	U0H1AQqt4J2eL9BRjy2NazQFX6fy6NQnadiQQw12vlxeqdXtqRICqgzCsPMReyAt
	BjnhveNxvn4gU3Qgb0zt6Yv+kwZvoFwGFt1F3pFFQ5gJ2mAUQKkcC7vBMKgmZn9T
	R5366g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv27y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:40:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9058a836724so13820776d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784223632; x=1784828432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfJShcmfLryO6WYoQaq8ODwaVGBiMme33GaRaClN7sQ=;
        b=IFq4xjWjCYtVp3oJpasmUv/DKcTV4hbr6mIwcH4F5yxCFJu6zUiycmb90kdPbHVGwn
         LUyCe2Oj2/lZ3dtTAw3dcNjS0rRYt35FogsxxV2v0q9iYK5qte1gVxz9zxPBXQL28h3P
         cLypqbt5ofSgNDNJnG96VDo4RsGQGgXeIr7rxovLFPrGJ3eBe/+HoQ4s8vLkCIRjne5f
         MQ/lrITxJ/z1/R2TBTv/P6Hjl4KhyL3g6PtAMsMTxg0j0k4lBFen8uq4MJGo0YMvBte5
         U92K2sAsxgQr7dRYmtQAMz5rD7RCNed7CoAN2R5eFwtxXIU16Tg/1hTsQWM4vS6G2Pk0
         Jvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784223632; x=1784828432;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfJShcmfLryO6WYoQaq8ODwaVGBiMme33GaRaClN7sQ=;
        b=ZWkGiZThpCwsYKTlfk5R3MdMMSRxlaOy4c6pAty/69z1DsO0HiImHGTLYcZvpHtiKw
         8cOxgdVDV8pR4C1dMmKubU1WSlqJcPna1fq4A/Tn2GB8FC0zeUarZNLm/eYycEpAn5wy
         W/jHXZzLv37kAYrBEMsh/oQ1NLqexl4WBUq3ChBhFBgE89iOB5XFHcc1Bed8QyhA7YQc
         EIxr6GxESreXyLPk2+LNJdC8BPTV87xUW0LDuLVyYQ4dZ1uuPDXxmCgjmG6HwilgZOmN
         ape3Y2orl2ftdIdPVHUPlEhAi1wH+0ZkQ62KCo5VfU5Y4CghkYAbfLfdymjg1AXY809C
         Ah+A==
X-Forwarded-Encrypted: i=1; AHgh+RpfEbDAN2omhHJCOTfQa6Br08Ofl7ueGcwESh7LnD07RQT/WGWkj4PRpwAO88Jo3OwzUlLutEbOPdEm6qm5@vger.kernel.org
X-Gm-Message-State: AOJu0YwuGaLfNeHx5FQ4DQ9ycBoR9yKPbtdBn4IYBSB9txtwPfIQxIXB
	stfAP5E3h8t3OOOxMLZE76c5+K+WK52K9Io42oMkaSe0q93iuHEjW/3v63/XGcYZFCdS84Mtoi+
	1uou/CJCp4CWAVvFlOiITultU2jSrpkpqP8RImOCRewhrwPQDdV1Ejo91Tt20TqmGTfER
X-Gm-Gg: AfdE7cnWR1CpdRrNx5Bth9dzrWFY1iYpPj9fPVyWeKmJw5QhTiPVwynkuhBEPloLNc7
	Prnc8qpToCxBBS68K1hEGqRstM4kpTAnfxqhopUGBxyDRV+fqU0P2Enwo44LDd/2mX5ofg8pgGO
	WPcyOaX5P+yviEZoy2GIry23guYAD+aILWomWOKhvSsEkT7E2d4zy9SxJJX4llORvTHgyF4Jtjv
	LgyYfjM77SRb/o6bBVKvSB9ilq9IqnCzet4NoE+nP2gOCYwfm6pK478sgb1VB5AnWgXtlee8PdX
	5vzerv8oV5yLxuQ+dVubmGEujCdC2xtC1auofyzGT5z2GfDbWkrZHShcPJJrel6e+2wzt67bf2R
	HCP0d2H9Bnrm1bcTBk6zCL6Q/
X-Received: by 2002:a05:622a:242:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51cbecf94eemr188381101cf.0.1784223631709;
        Thu, 16 Jul 2026 10:40:31 -0700 (PDT)
X-Received: by 2002:a05:622a:242:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51cbecf94eemr188380871cf.0.1784223631272;
        Thu, 16 Jul 2026 10:40:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871711a2sm253900366b.21.2026.07.16.10.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:40:29 -0700 (PDT)
Message-ID: <dfe9a6ee-17fa-4adc-9114-85d9a7bcef60@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:40:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: nord: use BRANCH_HALT_SKIP for PHY pipe
 clocks
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716-b4-nord-pipe-clk-fixes-v1-0-e4f583633356@oss.qualcomm.com>
 <20260716-b4-nord-pipe-clk-fixes-v1-1-e4f583633356@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-b4-nord-pipe-clk-fixes-v1-1-e4f583633356@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4MSBTYWx0ZWRfX5YfiAwzxec9/
 zfxhrlBhIPkdiFzteSovxkgu+sDPvzeqaV40pGA2VQ8eq7oFVkbEu1uF2SPCEhv6cbSCyOZa2Fa
 Bss7lztqcDcaYodXEq+hgDV3lcR2cCAd4O7VrRAe/fz9ni1TSPFzxu7uco4ZR60x/amfG19sfjK
 6dAhARGiVDQQzcVR8Q7IMPIp4lEouMSDTxHa0qd0/DboHywNJzPh/7w4nVXM4/AACMaRekYjobh
 n7c7V0QCB2tpqzlTa21IP7zLJrcrGathePHGhHw3USvlHoi0lb4YYA3uM7uYeL5uWAkGPKOmdiQ
 aWfG2kZgHf3qoYZLyGnSyB0uxcxw6HYGwiu/J+HsLFil9fFM9BckHgY05GPVeQliT+2BHPKW1s8
 myBHFcOUOxOHllQHNgGkpRbBJ2FL7G4bIclhJrDxqDh4uOMpWe7x5VvpxBiw2iW5oyEkm8Y62xV
 GdFrcNqrm3rml13539A==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a591790 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-NgSUSuva62yS0YON0wA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: _FRRGprnXNyuEvu-nbmEaemZPMIqJ5RZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4MSBTYWx0ZWRfX2nPitFyvjR+n
 o8p3atwNDTegl1+R/NzxKUz+6H7MxJOIhiwpewEFXk58W09kWgDAwCPOi3z3bsd23Ud15xMXpOD
 69iVXJybsoR15GnhZ7mZw4N3IUQuBiY=
X-Proofpoint-ORIG-GUID: _FRRGprnXNyuEvu-nbmEaemZPMIqJ5RZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160181

On 7/16/26 12:59 PM, Taniya Das wrote:
> The PCIe and USB3 pipe clocks on Nord are sourced from their
> respective PHYs. The halt bit for these branches does not toggle
> reliably when the PHY is powered down or not yet brought up, so
> polling for it with BRANCH_HALT_VOTED can spuriously time out.
> 
> Switch these pipe clock branches to BRANCH_HALT_SKIP, matching the
> convention used for PHY-sourced pipe clocks elsewhere in the Qualcomm
> clock drivers.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

