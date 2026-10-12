Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD41F49B5D3
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818546; cv=none; b=PIJvQV9WYGvcdiRlMYMTeUFeSZLMX+SoXeqeLD51V/eBuGXBvMp0sBsvqFa/GMLV1Q5Lryl/qx2fNj9/YWurs4XfM1SGZ3N9juSJigW+xCPk/7KrRik2mnL3hmfhTpBlnwQODsjIGaB19mhRwpbkhDkVCM49plr8Uyrm+76KomU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818546; c=relaxed/simple;
	bh=OU/ZOZCUTF1a+9OBByGIJG7+kpK78IpdvczEdEcaEDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IctjO8WHOcM30ozVDC1EIEw636rREnh5CvBewr6Ys+c4hs73e13MMOTQaiWyD4sorSyzzHD1PE2dSggE0aEbPsIdTs1AYVtkeKxUXKxCsaqXitJYIGdwsLHQXdoMy66hwAFqckStWfI14r2Pv+kiHw9hC4thlsedduVow9d3xuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntRNMBCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmJv89vr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntRNMBCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmJv89vr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Xrm2252917
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pg+ucC++OVs+P+7IDGhBwvltOq+8zBTV4xh2ZYbJjek=; b=ntRNMBClF72bd7xA
	PfTSDtBhmVN2vCR73iYXOFeVA9nzF3GeVu7FaPmbx6E3nCVPDwMdPW4IHvAWHMRb
	mxON3ieGHnygDWPoE66UxkDxeEPEar7p3cgdvu+U/HstUVANz4er6CFmZCRWlyLQ
	dHRdA17Z6JtXlZV24EwXMwniEMSB76WAI9gDgN43jg3nyH4BWOejW3kpbypp1E4g
	B9hHjmo3/jiq2N53gm+CSGiIUPd2pnEJF0Jciw3NBJpo5SCCapFKEJkQ+bAlV3uy
	ygmvPlqmC3IfnotLN18frROtHeo2g8IsH2axE1r3IHWhmSh6bQXmIE8kiiC1qZrL
	nfMGlw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j713p2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:23 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cba2460f8fso29641137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818543; x=1792423343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pg+ucC++OVs+P+7IDGhBwvltOq+8zBTV4xh2ZYbJjek=;
        b=UmJv89vrtw+qCn25BWa9GQisvFgyO+smlNRoE//j7iI1qOBE2tOeh52chF6jI6u6O4
         kGQ/4v9/ViNCsy57BDkqKblIBYOhy2K0yZS4S+R/+/EGIp5UIYOJnCqJnpS6f9nhYnS7
         OX8sDTNI16Pjbnk2DLzlA3m3lWGVS4THoQPAJkcalMt1sLj3jB5CFGu4ayXU4D/iyzpy
         WvjfU/fbOViGlZ1rBTcV+8c82+MTVgDMykJgB44AQ2CJKCDAgVbvl0khsBz8bn1f3aMn
         snRp/i0FHAWvDpjAyfvy2oK5sqmGU5AHA9E63utcynOr82ML+QmYL/OXt0kkqlwSxij/
         ySHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818543; x=1792423343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pg+ucC++OVs+P+7IDGhBwvltOq+8zBTV4xh2ZYbJjek=;
        b=S0oaq8PpgxMiVrXZg+Zw5HPEvZvnn+1wNmVPUHhCK41YvaQ4ommmMfEZhscUVXTxX7
         4ZADgXAhDGWoG/7M/sKKm4DxPn08RswqRER2B6NY+9wzsckGRfRyW9HB0zWJ9NH2DVLu
         EkbiqY75OHwEJV6f6UfJoqUiqQbUs9lLboFTEZpKyGDt3tcHhMVe2A1EO9xtSDOoUPCN
         F1S2LO1/2bo6cWHsdV46kKfe1N3AQhzlcEdp0iMTzoPQLFM/qbPaetKMHN82br6lxqYW
         Ujv/2mfEDclf2ub80RtxCdiG6qL3kkZeZpzgyFFcOWTp79O4+VDrFSYDMLlEfvmNzo9T
         reow==
X-Forwarded-Encrypted: i=1; AKwUvBwScre5IlYimDMjIIi6Y6eTvVIp0Xgcq4+tJO/B9iDGM5Q6o6R3zk+I2/M+bPxx19mVQRJvmsmmnd3LgR4S@vger.kernel.org
X-Gm-Message-State: AFq9FYLQbbtQ8TB8UH9NDnPHyevOBu9ISDu179ClO7RYNH932Lo7valZ
	6Qh9oofZspdRG30ArSQh4uflpWdcmNUueVcO4znoWD+PCXtD1VGX9D4ctHk0aX6ufRkTdVSXsAk
	ewTBSy9MVILF5+9zE7IJGre4mSrp0YxENQAWgE9t43ppoNVoRf4w+Y6RCd7O0Y5248m/6
X-Gm-Gg: AYBFou3/CShQaTO/2TJcj4ugzamFfypL644zuxI9G4Ed84xGlykiyldOONoL2i9ujAI
	Cxoj7p8byh807RKN1BJbZ2ppsfergKmgze6cIyU8wOqYB3ysaM2/LIuo6QKx8Z1l7jsbwCiJfI4
	rCaRDCKRTZHXGMYcs2wODguNoYiMWKA0YvnvhJTHLBo2OAqhoeMU01NRyyArSU1tm00+he3aGi0
	kera55ywpfMUOH8/N2Ds7UfQh2tKLtRRZ4WW7cgXaAfefhimiyD7aIuAxof5YjPi+3yqD5a0sdf
	zhLroSTQRkk+9qQ1EqlxuZ8Jm+3BIqcndzd+MIpvFxoLnnNXIlKIxs5GVSokC8NcQrLVSfyIK10
	mPN8SBvENCyVt7vg8m5XYGg==
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1457733e0c.3.1791818543000;
        Mon, 12 Oct 2026 08:22:23 -0700 (PDT)
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1457723e0c.3.1791818542546;
        Mon, 12 Oct 2026 08:22:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74bcbsm478161866b.38.2026.10.12.08.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:20 -0700 (PDT)
Message-ID: <f7b698e2-e8cf-4ab7-a08a-40c15c18818c@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/38] arm: dts: qcom: pm8941: Remove superfluous empty
 lines
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <5c6619742e9203c7c54abecd7e714ed2906650a6.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5c6619742e9203c7c54abecd7e714ed2906650a6.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX1o0jbwrKNX9s
 01nxhV0gsVb7WmiJMDf15w4yL1pMF5Qx4SuJ3ERv3svKnmMy9JKfyJFHhGEdWTFg3/+XHu1Utye
 imv9xtg4T44pnqAHZvpFuiFlVjEbPe8=
X-Proofpoint-GUID: ApUZ4iF0afKuWKdywcZr0yWX87Hpaiul
X-Proofpoint-ORIG-GUID: ApUZ4iF0afKuWKdywcZr0yWX87Hpaiul
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6accfb2f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=bwAYAckmPWK81loY6icA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX8prVkkf9YqGF
 JNt1Fb2f/pDxQuIF0HCzVUfOhKYb914+4ywq+VRP9le33yyhzL7wf2+lb2eES1dQefG5dDxz9h+
 dv2FiKmjH5BY/ygXnLM86d5S+HF+korD41ZCgrGt8j+1ZlxcIg38SZj90k8BcZmkUiP4Qrl2xgD
 vjK4LSXOk2WlD/8C2aeVdFan6BvVscOC+3MhF/85YM3dP09m/41rbGFtaS+n57GGT5iZB7gOu/V
 +l/WjZAp4qI2bZOGC9Dl1uVfFFFJuLSeGfrDPNvB5w2x7YuxwLbr4MAmY4DTHQ+ji2mRuXcoMS+
 mHHMRZ8yPGiZ4ZpmqBH+OEG6x7rLtyvSAl77M30HYLVhHKeKzG8X6nbaDFHLWdDOSlxv2RoiSQk
 pj2gmomFSlQARqoonx8i3g6CWFZgNC7EFJV4bWGK8toRDRbk8Zh/kmxEScc+pyVepWK4zrPpT54
 wqohul8WUGsUy5vQ7Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be a newline at the start of node definition or multiple
> empty lines. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
