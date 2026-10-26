Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020724;
	b=Wj8FefXA5JfUVcB8wWFkErvreeF4n3+SysVqxvF3nybSN69NrO1TmGxnPMH5V/thGhnY
	 9WSW14xNWGulThR1rFwFrDu7NwUM8DmJtPMt2H3ngPPT+M/HCHeqpqGiY6JA9UAxXgoVc
	 keRBml3NjP8LstpmykRecjPHd0JDrVMaDhRfLnm95a7qDZwAcFp/LfCuJGggCG4MFQkWI
	 4dGX6s996iriZkRiUHXtd96RPqSPIsoLFyVMaoQQEsikrN9MrURnP9zZ/7JTGs4Mzyl6r
	 i4kdnxNfk7cqYVj4D+7SgoyiOy8Mo2T3HPBvyQbJXROyUE7C/X2dPL2+110u2L56/WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GUPu5fQHpeRWI2JD7GTQ9q0TkqAW4QMgFXrhw3WM10k=;
	b=fObk/TXLiHysy9zYWKuFvg6gjfM8xTzGQsFjVEUOW/wWXljRLGmiEmjczOFgaBnMDAba
	 Z5cRa7Ow963W4g4ebhDFpA/JijhOdH5O7+pEY176G0rDC4pPveFzr5cSHWNprPVLLhcdn
	 hTJH65O/z0M71xnsHOWQH+IZABA6+KEjuHk6cTOs5E1t2ETMtRrBlQ6FDnx1jlZ5YX82m
	 aKZSPmQn1MibXSd8Q3DfQHNgvbHRFaQjWQ6N1FZkGhsQFsb/PQmrwiGc+5qHTU/vAEJXj
	 VYwU9mrsulNWEhUS9Glbz+t9uY6Q9DSkTj+lOU7J8VduBmNI+t3lHePeaBvguhPE0Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jJ95T/75";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TV51eRcJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6844660A261A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6844660A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jJ95T/75;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TV51eRcJ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtFxb4126973
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GUPu5fQHpeR
	WI2JD7GTQ9q0TkqAW4QMgFXrhw3WM10k=; b=jJ95T/75awVGsB3vP4B1+UOoQLo
	Qgt7MnhR8qgQLV50C2F0Y1HsERqr17c22qevWV1q66haNBryl+w45Cn1Gz44h0W1
	WLo/JwmY7Lmolo5O17nKU4d/3tNFGKtDkNBRD3r8BD0Tr6GTMlc2dsIHz/Q04QUY
	eAs5Di2dmgTRk+xh5h9t/aLvVeWEGtmA9qmI0XTgBgKubgYXsPx7xFwqHuV4syMh
	LUm3cZAky7qILsFjRPdeOCmmff5Kyxjt3BnEXIHiWlOeokQJ3JjuOrWle5083gOZ
	PB+gEH6ySZtDyg4FSMIABF0pEgb0TULwrn6LukHtvk/0aChiq2PEZ737PVQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpthur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:18:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f62934ef6so390601085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020723; x=1793625523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GUPu5fQHpeRWI2JD7GTQ9q0TkqAW4QMgFXrhw3WM10k=;
        b=TV51eRcJTaNUai6lT4V4UwJKyro0v+60Tarsfa/1ev0IAnm0OePHkzhgl0w+mfXcRK
         eD4Rx60FfP8lHu/sRAddEM+K3aP9CDXQOwZpP55QV7wFTWkk60o243cKvA+bbn/Vau8C
         pOsh7yHnu4HhKjaic1/2DqOocfSW5CJqS7kOH9YlUnvVHIXYV7Rj/2087hBO+yiI7LjJ
         R2dlf1QXtIARYW2xwVf0d4a169thHSPrsdhf/z/S3U1xxx2Zc5tI1wBwc1HPUoq9p6RB
         YUtyASynqxpA7yRyLT0qVfK3G4pASvtzXILfrBvU6gyvbr5z93a+iTLeJ2RSMQlrI95A
         hfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020723; x=1793625523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GUPu5fQHpeRWI2JD7GTQ9q0TkqAW4QMgFXrhw3WM10k=;
        b=ZI3xyKbCQcr1l1NWCpRZskgpGsLQO4vUNSPRi3Ils0ppbgJxgAW8YBfblQptoYrthj
         ke9xyD4sTedo/VRcmLGJaDsIwIhIVI6880cuiWuNgPXWwn/gJuTsEuojZPcB3fxj0VQp
         lUhtNU+Ny3TnkrlCxtRTTJgRyx6kPxFJYjV0ImAtAf3faWD84pTiJomzS/XeFdEZxzz9
         q0rmutsUE0rFAu1l5QqdlHvcBa+4SeRAm8m+MRLNm8mC1HAZUIuoVxNCJi+J7yQ8eoW0
         HkIhgDywXcKr3dDLy/lRb06/QqEsLz/zkuc2JOtpg2DwwhQ6c8Tgz4nJJZmjyR1Pgo0p
         E6ug==
X-Forwarded-Encrypted: i=1; AKwUvBwDiIG7OJF34T//CCK2vCTK1ws2PZBcYDOBbFsWbh1Dm6fQ1S/61JfNXwNc9HShnzcmbVqfjEx6H6yvW4ac@vger.kernel.org
X-Gm-Message-State: AFq9FYJpMS52iJVGlW/aZHVMgASXc2FG1pG5GmopWUVQw26WvchBWMfv
	PuDQCJPAU/J3dEEI3pgo3nLvmXRA8kSjNH8ySBJNjOBIv+qk3a3NAV2aV6wP83USnnwlZSgUlZ5
	6aP3/DZynWjhP2kfVoDDK0M1dwKal498HbPlS4tfqkoggO9DyDQ14YshdPo5qiuOSe5lE
X-Gm-Gg: AYBFou2WloAVcM9QJAVq+5Mi4Xbukqeg+ReH2hIOK/Z79jyzjChy7q3aHl0LAJpej5n
	QwjDLdN16I8gCaQVCOBI/0MwvUty1t5bxHmcYSdNdH7g0fWIuZj6wQQtYz+cFmKIf7aDUbdQzK+
	jxm5BWjhn3obKoYNsc4cAIwrokwr80U4kGxkV9kCuCElDSAUdHWeASTDHcPmPfOBaMblVTfLSmo
	zQIUE7Ue/RZavN0QgYzaSmAV0pwOOfHVZsc/Q3f7ZCQqiCyo0LZqzMqpgtwvbuLMvFbCTyLSTvl
	FLo+zRVp3ectVs+kpYj/wvsVedVsekAx69fGtH8kTRoPFDs0RnGc7pytoCcQTmP0s3/bsb5DSUi
	6U1vby7BqJppJMeIgLRNKb2SP
X-Received: by 2002:a05:620a:4447:b0:93c:7955:afd9 with SMTP id af79cd13be357-940ef8fc7eemr865181385a.52.1793020722644;
        Mon, 26 Oct 2026 06:18:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4447:b0:93c:7955:afd9 with SMTP id af79cd13be357-940ef8fc7eemr865177385a.52.1793020722195;
        Mon, 26 Oct 2026 06:18:42 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a033702sm158170775e9.2.2026.10.26.06.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:18:41 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
Date: Mon, 26 Oct 2026 15:18:34 +0200
Message-Id: <20261026131834.3247963-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <35facf70-8693-4d7a-8d00-b884078f0a99@nxsw.ie>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-7-atanas.filipov@oss.qualcomm.com> <35facf70-8693-4d7a-8d00-b884078f0a99@nxsw.ie>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX0sNi4yWoyQoq
 70HNJ3S1CINUP8QNOmKzolrmQQEaRMQSWaoF7uFoN21fbUMX2v51mVKJRKgVXxgVqMn9BVSechX
 /2qFKPrDLfatNCKB7cIvF16BGY4rOGs=
X-Proofpoint-GUID: TLo3xDABwoUxWsZoFtfeSBAQEjIwXv-J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX0rZq7sfOM7/q
 mqg60yhxKKhWcrtBl4Gs9oeptjL5MXG1xZTTRCmmcg3u6tQ8UZO3Hjyx1XzGb9KJCb5KMeSUKw/
 9HpnMCEQctRP5j8l24juphM8eJ34f6vAWcCck9iLb5C6bpcIQAmTeVoY1BbxHeCYbGbptp1NYwt
 qjGJbJt90DrEcvZc9mdU7tGcpCQ+DXUUo2lU9jn53pjPdgMvQ2k2Grpej+rrOkOAwY2R81muAmi
 PEXWSbRveYwt03g4SpRZS9BGwM3p4Fc4MfkClKQby5AQjTXeInDsh3jWGN3iwjTQHYpOgKW6Yzw
 Vt04Q/bFxH2DtmwcRbdpTEZ1CXlj5eupcp4KdKBk6qyU/HvPDvQIfXBYvLNp2YPE5gEp0ypevqF
 qULyKFFCogs6Zrp4Q5YJpF5+MohlBQMOZ/Q+jLiF+AHUiGEFrqUU/PwWTkHoBYLEYP/p01urp+v
 qesdbEAxlNC6JjFvjkg==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf5333 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=mLqpLkQxU2AaqChaJ2gA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: TLo3xDABwoUxWsZoFtfeSBAQEjIwXv-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260052

On 26/10/2026 09:25, Bryan O'Donoghue wrote:
> I suggested bundling in clk_set_rate_range() to this patch but I believe
> it would be more productively and correctly done as a wholesale
> replacement of patch #4.

Agreed, v3 will keep this patch to the camnoc_axi rate table and do the
rate ranges in 4/6.

Regards,
Atanas
