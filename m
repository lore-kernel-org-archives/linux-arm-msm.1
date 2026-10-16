Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8A83B42CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150570; cv=none; b=QRH70Q5ya3hVNBqX9Te0AlHACkhHPyUDugfZE1CDCOjK8gf4SennErxwtCyy+zDAmTUL5MeBZ1uRzOEklGFVfNWmshczRIQwUxsE7v4HXb7FTrRBArMjVNwkWsPhNdi5jOfI7zYWvV0khRMg18Hc+OQvAEQG469jpXn52zlH0CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150570; c=relaxed/simple;
	bh=t7vjI3D8+2hpRG8hMeo2NZw/dSf9FKKg05cLMXn7q38=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Mtn0fSNo8mNPSo/NTcsr5gr+xSrUU+/30OHRDzKWuXH1rvqUyzDl9cXbOyaO9bIQc8vYnQ687pTIK9C21Exc3edEyyxMazrwRoczyyuLdgfAJg5f5WAvOcWWdnduWD/5f/Ose5a4YxIEP8hU7KXlcg7w7BY960K8TswX6ETNoLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVQ2E3tN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OII1qXMo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVQ2E3tN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OII1qXMo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAIxM2998513
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 11:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9ksAcVBjdGqd34D51W9ej9hy2JTcpACMlbd8wtFSMY=; b=mVQ2E3tNY9aRs3L8
	4d2tL/WbYSrzKEFQiibEOcePQM/k8n8ntLf3KrIqPiT9azT80N7Eds1o7OcccYQF
	7mB/NuOT3K/5PhUYFZRSR19kJ5q8glTYGTs/leNvodLhY9rzXQ+QpQF3TyJ1GqIX
	6jjsiDapMcLbsO2UzvLVvJEoaDhWRAsE3ohr56BxGYKZS9IqLY3kwbSsKkEFUsf7
	WyMX86GD5Js7c+U6AKabfe3wRsLrvmbXYnSwgM/T1NZmMEnCBTrdAlP1Xhr9YaqZ
	5eBLklcsU4ARdxUC5kXdpMRLKxcR3XbCqcqLlelIc0nqQBMrWqa8mL4LUKA40oer
	4IK8/A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r12br3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 11:36:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so17618149eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 04:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792150567; x=1792755367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p9ksAcVBjdGqd34D51W9ej9hy2JTcpACMlbd8wtFSMY=;
        b=OII1qXMoxmrElYD4oCjGt33y2mvWi9VWKg64j6VAFAd8QlxHWIwNzIciJGFR9+A1um
         /jrebh+WBjXFPZFOwD+PCCBYBCiMiOICdQ8ykvnkZ3BlT2MIqJ+8RiGUfUFVD4Uw38JK
         MfsSuwuYiMKY6fkb9dRjJ5FXnlaMND9Wj5ftZckmV7Ijnq9A8In3ZxMxop0BYZjyVi29
         SvdcjadWnM3sNT259azTe1Mwc5DbxuV9LvHjufpIw9RtAMUKaYashWzCFQ779QxrJdps
         cv4fSy04793JZXZe1gAR1FQ/Jq/NUdWpwzfMWFJV76CwLlNplNmPb6ZYfwFyelyrMiqD
         CK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150567; x=1792755367;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9ksAcVBjdGqd34D51W9ej9hy2JTcpACMlbd8wtFSMY=;
        b=kD/ZXfylq4q/i32YXRYsMzw/g22MESt5rgTv9KSbf5MDb1Jl4HoXdBENLOHJsBEIYy
         9MtP4jD5dx/XIKhi7Ua6okpgjdFLnhNjX2WtfwJhAVqhXQLezOGGj32ZQJMD9G10kA0f
         sn3xv+UwPfOsShrxigewiJAwyt+8hwu5e0exUWwhTnSN7eqrnqu6liYAJMzq9Q8CfAcy
         k1vbH67uZDLKdp/DGJzIFGSkrotp09ihXcX3BEIc3AlfliPEdUhathTK1w9EUodtD+BJ
         aXdH7DasV215MVthexpjh6y+ApK6i8wwgvVpMkAY9kcSkgbWiuTeakvxWZPFxlXDbFrT
         ArRg==
X-Forwarded-Encrypted: i=1; AKwUvBzqI85qgURfjRypvkdhNjvQ6G0wc6LGFwvr5Czjzi8Bo43kcGjXgP9H8/wmPvCR69AsVF+8VQ94ZZO1kHHH@vger.kernel.org
X-Gm-Message-State: AFq9FYI728YbxY4LKg7SDHIL9Rlifk82bFf8c5B/ahJ4t8kC6NwSlTsK
	/xhlD+th4Tpgo1nPM2FtAwuDhQqGcl9GlmmxJ2ei5PKYRidUMYxjElwWvxt4ntmHfxYDA8VB6yC
	rTKqNmFVSISRFgrSOpoW/aCuscaAYuPXlX9dsnvRJNTiLhLWR9Ni6obYwTtmNn9UiaPzp
X-Gm-Gg: AYBFou3ZYni4dxt7jlmwpynVbSDaTCbgfdugNM6OkApkuarsFv9MdTeEaGy0QZWhpq8
	GCGzPqwmSshg41O13+BUXPjQeopwsIehsRjYet0/5Kb3um5lL20Vup2CXAUS7ptjm9qcjobA26Z
	Nwm2/joOOtfJO+R+wWXTw90XoUkZBylOWaziNKcfnihHuPBy35hWaikpPqX+QwazDMEPtrqq59Y
	RCJNSKhVlx7K6asZbtGGCJsAMJhifl7dPsGewCFCxl/1kcvl1orv7cf9ifHMXbFBKMhoVLK62py
	S57qjG8DdLNQcIXdbZMfvXfdV/4atO8ahNsC8+3TJZ2fJLGiaABr/MPypdGNJBv+4GmkhycVNp0
	x4Yf7GTeNLrb6QclrjiilI8BKJ+0=
X-Received: by 2002:a05:693c:60d4:b0:359:2a1f:520 with SMTP id 5a478bee46e88-3592a1f0673mr27197008eec.24.1792150566612;
        Fri, 16 Oct 2026 04:36:06 -0700 (PDT)
X-Received: by 2002:a05:693c:60d4:b0:359:2a1f:520 with SMTP id 5a478bee46e88-3592a1f0673mr27196976eec.24.1792150566030;
        Fri, 16 Oct 2026 04:36:06 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm10678942eec.28.2026.10.16.04.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 04:36:05 -0700 (PDT)
Message-ID: <b92c91ba-6a1d-4c9a-8c5c-d4ed7654cc99@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 17:05:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH RFC v2 1/4] phy: Add MIPI C-PHY mode and configuration
 options
To: geocausa@gmail.com, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
 <20261016-x1e-cphy-rfc-v2-1-377654253193@gmail.com>
Content-Language: en-US
In-Reply-To: <20261016-x1e-cphy-rfc-v2-1-377654253193@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5INn5wqdz28a3t87iyOmb3XvFxpDFHIA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0NiBTYWx0ZWRfXxRIVd7f29DzW
 LKI4YIGO3CTu5JiwFMIL2clgppbHRba9xN74HotdBRJpUtrJHeGNFoh7BvA5/4kO/q4egom7T1+
 jeVhKhCObHiyoWXqI53OHQf2WS48A5w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0NiBTYWx0ZWRfX78YbQZ8LCBSz
 JDr7t5CeZ9WDvPUeZ7EF1XtteJ6s3k/N5ZyNewYPGU+lE/7cBHXbPrUATp2zF7pYOlgv2iaosTx
 alsp2XcPBwfFGOWmdCpyn07gkIkGhweH/wpn2zFV1pdxxLxt74CJfGQk5Sx0U+QxbNMIz1k1Vmh
 ON1Oab/QN1tkZDDqjgI/EVqYQr8QY8cT7WGypJBdTEEBofTcE2GPmaxPNViYy5eotOz77+fZsL+
 Esgp9l5edZ+2os9AMxVljmyHeOblf+F55+w0zS//cz8dZUsRmhQFOpEsq2etPRzQ1j1bJ8E0RP2
 EPjyWsITjRmFdRGMZNpKziFZmBUeHxC9rfR69whG3H4w3TdoN5iouLo0p+WYLcP8HYfn0mxKIbf
 Cfy97aWJ0iSqPHyMAZ7W4+stnxqjh0EobTLVadee2QB42g8xX8P23TnI37M3q4fot4PZ+MNplI0
 sa66fYWuLJ9e1rLezZg==
X-Proofpoint-GUID: 5INn5wqdz28a3t87iyOmb3XvFxpDFHIA
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad20c27 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XL7EWEVnQUwZ90-4yZcA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160046



On 16-10-2026 16:27, George Neacsu via B4 Relay wrote:
> The first user is the Qualcomm CSI2 PHY, whose X1E80100 instances carry
> the C-PHY front camera of the Surface Pro 11.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

-- 
Regards,
Nihal Kumar Gupta

