Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875A34C77AE
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 11:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718694; cv=none; b=rDVPFpnrEdv9PRo4hArTiBnGJqpmUsYexlokU/hTsry05h3+I9bn4zcguCG+/xhh2R2H4iZLLPZM/YnU2zFImaN/vQw8SJvWodbjHHPMpZOPWRnGFAyWZr940sRbnND6pVFj4Zh/Vy22og2gT1WLEFBjauzbEy6DTpAD+7oGmCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718694; c=relaxed/simple;
	bh=P4AV0NSS3i0lFUZKQLHrwItBL4otfRVjt8sqN9bDhBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qb+KXaufcmxAhutxCreD24RCYtqg6jCgREOast2l1yl6EBjzOmdwGN3IjKpR+CxXkS5X2o9Q+l5Efq7GTtxZs0ijsDWxm+QYk0DtVvAm1GtFQ6/mqPjhAw8WoX8GgrZSIrOekSuC5gJ8hCX30xI5Pzg0O/JcI48rgGPsGormE+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGMKN/sh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DGduRF2W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGMKN/sh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DGduRF2W"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xKqm237633
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 11:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LjDkDl6GHjaP2K6Wxf5HBn0m
	3ojJMTS8H6Ztvo6AkU0=; b=OGMKN/sh27MBp8fdMBcNoNxZNySsYJXeUD9IucLz
	+k2a7k3gknZJwzve0wwf+AYl1iLKzSvS3qFggq48ZxyTBLxshMhnrvsDgKBT4LWg
	p4zKAR5ZULcUgmYInwft/VdJKVBdqEmavMr78mTK8PJA97bfzZqvkRX++DDpHte8
	Xq4lmU32EzCzMUeCRg31NJ3utyDhraezGULSfprQvXdg13wjzPfzHQ4qDthy6Ask
	TAIW8m9Is299bbzHMUr2zsVMDd0LMVptCyIFhKK+1772G1VQxOepLhwkw728a18a
	0wsdYmW8elJls+zP3PruwTg3xGJ37fkfFUwF0ej52vFMAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn1t1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 11:11:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52769fc3f2eso30588341cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 04:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784718688; x=1785323488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LjDkDl6GHjaP2K6Wxf5HBn0m3ojJMTS8H6Ztvo6AkU0=;
        b=DGduRF2W7/j/PQQzncIpX99tj/mlmFJO9wJk14C8wjTqMMKjodTbJhLm67vgMNM27C
         kq8PwVPuiIGdTddaj5vDIS8wH1VQVevofcnxMCDpq3uas0I+3+F7L2v0jup5RbmpbXLX
         XNH1+Br+ypiLuvEbOngs9r/iEMv0wT0I7RHML4WbO3+ztD/1LZ9R61rZn2eJy3qzaoZo
         YUBDR51G5gZiwt22qfzO+7k4Hqf5Z0TLtjS5cVIA59qO2I37lBoXxCAXfjj59ss5KYj9
         UVCvb4E4uHbynqcVq+LzjIvlOJWkUP08HkKSbKXt125Dpnw1ONiw5/t5RzGe+Y/h/7Yc
         +ClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784718688; x=1785323488;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjDkDl6GHjaP2K6Wxf5HBn0m3ojJMTS8H6Ztvo6AkU0=;
        b=fMue6HcdxSYZf6Y6Btis+wyLdauDuNsd6sjvtcrl890bT/i4GYWeODw3l1FUSdZtjX
         nmQ4rkCit5yvfoFM7+RVP2fdQmssAe+3nu78D3B+i9egIfq+c/2tC3Pv9+5nW6YZLoMq
         ehQV9B/E1AFZQDxuopYfhLNiu6pHE1BI2BQFKU9pKB3Rk1DNYaiK9/79Twdrrn61gMNl
         PUTV3HPCwlmq5LrK+6TQtzqLdDFW2n6ECGfLvmylEGOcAAGPJN6syGqo0aXSQtTTBLNj
         rv4UbuTvfasLoE2XBjRqYYV4LiLsk0vfWumtb71EMKf18zJPEzttdknsGuisF74p2rqf
         FGhg==
X-Forwarded-Encrypted: i=1; AHgh+RohWD9RTSSJK1d2HcmexiUddIGE3DB5m+Gx2JVoqtAf7YjDxpWyVGd8FzESAb157j+DOCl6ArRrFjVn/irx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp5tAUFGADWLZzTKj0ibKrj/KNfRNlwE1K8ffHBZ8r4ys6NGd2
	/c6NNNxh8lhk8i05ITdSkicaj+AJNExchAz1w9zeVCSXDiK8mCRvLM5qx4MEySs6S9VKlv1rRgF
	nqHQObHOxFOCQezGdCllXz5pvhjXL+WHOOEVkUE7xD7U8rnM+XZenzK4w5dvGISZoH5au
X-Gm-Gg: AR+sD10bPO0ly/BIiq7PlRlMHx92I6nu5+lm8j8zahdIPAITQyD3Pyma7GJkW32LAJi
	hmqyyOOzNWRDh8Diu0wijjZ9wMlYI2fl7LU7ZEQp2FlQrPg2AlV4tBZ5sglkI09LkrxyeAfnUk8
	hMQbMAP4uMnGs1gTcImLwiLf4P+GpI9aCa5YoFdeWxk21DvNNgPPmxrKOrNu2AMllYYAYy9Mc3l
	hpCPRKpNVsdYJxwJbFKR+fCSIvUQpDbuBPpnW8mO3s9vvM0VYJ9UozS7qtvtiJj53qJPchAX3f8
	Ig92t60SaosG5YrrippybZJhPi/4R/abHSdXHfbNEg79QA6IiDelNd52q9dHMRTBHqF8OKIEUOu
	cE4Ddh5hYBjlvC2U=
X-Received: by 2002:a05:622a:5a17:b0:515:189c:e0f8 with SMTP id d75a77b69052e-5213bf11467mr192454421cf.17.1784718688034;
        Wed, 22 Jul 2026 04:11:28 -0700 (PDT)
X-Received: by 2002:a05:622a:5a17:b0:515:189c:e0f8 with SMTP id d75a77b69052e-5213bf11467mr192453971cf.17.1784718687361;
        Wed, 22 Jul 2026 04:11:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653731b2sm140441475e9.4.2026.07.22.04.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:11:26 -0700 (PDT)
Date: Wed, 22 Jul 2026 14:11:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add Glymur QCB
Message-ID: <2d6l6id5dkuncuhwp5q7626pncclnnvo6un2byjy4ugsayheaw@teybqbkxhixr>
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
 <20260717-glymur-qcb-v1-4-aaf1cff84aab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-glymur-qcb-v1-4-aaf1cff84aab@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60a560 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=dXkGG8lSNh7L0qOfzMQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: vLuU3lA7_K74cH7nFUHpgemAkbl85VOa
X-Proofpoint-ORIG-GUID: vLuU3lA7_K74cH7nFUHpgemAkbl85VOa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwOSBTYWx0ZWRfXyVtCDXXi+8Qd
 IDcwrrlMZsQJHMHrzBMwhzTWJ/p5QIC4RHdLnl4jBMXFTGTXbFwr+Y7WFK4cdbYOP/ZQghOut5u
 3r1oqR0x/90QA47K3mx9mM2rRaqHtYs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwOSBTYWx0ZWRfX3DoMA6Db/YrO
 +KhfUxJv69NILThQ0T6EA8BS7RQFGJaBcDSvgJLURodYfcDktSCQoR5FiLWxVrc4YQZ/9mULc6H
 n+vBftoZg49H2mzfGYcE+oeeB4BK9Tx4iML7WmONWU93k1EYedlHsLp+SO9EtB1P3fKru2EXU2+
 VqmAiUdmphP/ItgoPTMoEO9XVeqlKcbR/UkF/88y5k2RkJ6avr7Ho8l2MLftETn+tASoipQmnQp
 xAcTCwYxKSVv6cFRAuvjIEL6XdS7CgWIIXhh8YWKwrMja7PUsxTfjThpo7bmiQdlQRJ0QVMgRBf
 I0nF2Vp/Rj1aLbbFG4RdQ2qTEMDx9lPiSydXDutbA0jdJKifyFfBn174tstWhpsJ2JuTua3oXHk
 HTT5iVl3BpJtnBd9GW3SKE3RiPWQEu6S9/bRflXBDbPJnTWcdaAjJLVD70ggUr+N77xDqRAdQ5Z
 OpPjEbKuN2W4bTa9+lA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220109

On 26-07-17 04:54:12, Gopikrishna Garmidi wrote:
> The Glymur QCB (Qualcomm Compute Board) is a Glymur-based board in an
> open form factor, aimed at compute bring-up and power/signal measurement
> rather than the closed enclosure of the CRD.
> 
> Add its device tree. The board boots to a shell over the uart21 console
> with its root filesystem on NVMe. Enabled so far:
> 
> - Board and sleep clocks
> - Volume up/down keys
> - PMIC RPMH regulators (banks 0 - 4) and the NVMe, WWAN and WCN rails
> - PCIe4/5/6 controllers and PHYs, with their PERST/WAKE/CLKREQ lines
> - WCN7850 WiFi on PCIe4 and Bluetooth on UART14
> - Embedded controller on I2C9
> - ADSP,CDSP and SoCCP remote processors
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
