Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873509;
	b=KYStHKteqlxmm/B3zjmUCuXfGXcFrttspPfh6cMhPV8TwLsUROfHsZiid/BMJsx+PKZ7
	 oSnqBjliym3Oy2jwqqm+1PXqD+KLmaASamLt5jVNrR7T/hJdo1+b+lBAkVZWCyucpdiHO
	 4JN2VUVAHeHwCdzqMJpnrrIqaDlPrv8Ft/dKBYxTcZXwDvqkB3TdGxfYqCgIXUYgLuigS
	 n8ZxZjeM42B4qlLE7YEb02Bu4p7c3K6j3kVAw4boWixPhxCjUv8BCsOvlZP1Kn4TXsu1i
	 6DXlV1M6+y2ojBlR6wdfvQ9/4gwV48/Gk3kGOtO+p6OAO3ep8nGBIG/Wta3jufpfDhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873509;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fvgN99J0Yong6xuWrkleinpqfRDCxfSse99001Aj3X4=;
	b=2u7TX1alWJ0FLMhhLL5qRbnmEhm0vVM6D9EX7T/In4/lqXCEmysxY7lCbyI+klOhxp5j
	 Jav++Tl6ZcAJ7ugnccyNOqX7RkZ6EFtuvmnLMYXQBTOTWfIefk/5R8UBdFXZPAjoPR3lK
	 LhAFeA4+6eNwJXGXON0yr84o3kj6XlhBkUun5QNjehAjp4/kW2LUnYy2OG8hmJVDyDAgM
	 atACT8O5v1/wROHTzcpRNnrJxYJesKli0DzDoB2l0NJOnU1dWP8vlPW4iHt9ZzBPwjQgY
	 V/+7AswXpxtgCToCwXsndlR82UJ/vEdJnAwJrEJeQE0Smjw+1Er3/r8GnZF0i4HXjCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODDHW1CF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UXHyF38b;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5486B606A31D
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5486B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODDHW1CF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UXHyF38b
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OIU01l2286723
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fvgN99J0Yong6xuWrkleinpq
	fRDCxfSse99001Aj3X4=; b=ODDHW1CFlJuMQQ3T8avwNsPwCAtKVwoK0Y06DwmX
	aK4+d/g1DecejGeTJDL9UbzyumMpgrUw9rIhv0ldELoSBTz2P8jeOyx+FTBY/1+s
	ifA91KBzkJbeEAEaqWnk1b2ad59VOkK0ScgDKuI7Xv7tuoEOrEfix+xklow7LyNv
	F+bo717v+uZwbJolfk2mbxMSqBsVECH43hq5KVzpnWMfjSKMxtSUunLdLq2cfQpy
	1fjMx3ZTAMAxhGBAkmDmq91RQwEf20Nbwi8uZo0l1AzANQhdpdk6GSFaq8iKR5Zg
	xjVyyU+tSuCs9gauOA5HjXSiLohMpAL24KsyH3TonboKoQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmruhqgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:25:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f559420f3so187574885a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 13:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873507; x=1793478307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fvgN99J0Yong6xuWrkleinpqfRDCxfSse99001Aj3X4=;
        b=UXHyF38b4xgm8WBKDhJLeJvtzM+aGdMkdpXoShW2v+NBXljPk5XcEWOgJE5+vDRJ+1
         UGeCtjsGLDZ/KMDekgIclEjxSl0GG4TB+4N/fTRCM3Uc+rrS7VFYJ7Z/Am2S7jfNlKl6
         U5yL1ugKPY52Qyp6kn7zrCmP9qZTrcAB/+TUOk2nvoRhMJuaj4E/IXtVkuvD6cXFDj5V
         ePzAyaQQyxjNIQxBNUtU7v2pIi0BRC33NzfawuAo1hhYfVVtZAmemkHw0K9qA0RmDfbE
         apExoAuGJSQvnNSGvwlr5pON7KtBqD1EKX90o/YvbZmRpUUxhhtn62n0U7mgrEdQxA7A
         0OJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873507; x=1793478307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvgN99J0Yong6xuWrkleinpqfRDCxfSse99001Aj3X4=;
        b=vN+UAwyBle9m5FBIaARKJYj34vbYRGIk/8SJ80VhLs51fQt40PTCE3b0zSfiYu7f1P
         nMx3DZzTn+Xa0H+heGhQEZw8KF1+rea3Aj4YISo+b5wOD9/eiXPw1EKWvjrVN2sOU+y1
         JfWHCAnUrYsP8FSl1zzlNOuQk6JQ7rUDdKna7JBVWG/AFPzjs2aEGLAzAloBJBTNP4re
         ESGqxDHcdd/vmJTHlNvfzUQFfYXocI404Kome3qMh1paSQ90/rKhzMqfPErz7os2rHWN
         Fcz0vo1pWtH/mHl91YNgsAbst1+Pms6Vh7emDZMEnSDXfooX9kkzkscMEaDZ7wNWT87A
         q3Pg==
X-Forwarded-Encrypted: i=1; AKwUvBz0kjcnVmGAMNfdkBoxhGa7SFO01APru8dlt6Q6dUK46fQRXxIy1Mkxi+2ZJyDYndnVpMElXy5HVUMQtPVm@vger.kernel.org
X-Gm-Message-State: AFq9FYInrK0eEuAbQKrIm0d2KmPp4aOu+nQORFzRn36dp8ft/yJBq4Od
	LKBEC25fp6C/4luE7DP67lmE6uc8JbfX3hZpM3C3fg0NE0CR5wZKDDQzmE0KT0sC5oA8evBBqgS
	nlG/3ixVhe1nCvR0UFQB3y7d8DxnwbEMq51qeOxpsguth0v66dXFLHvFEYzqU6vBF3kKb
X-Gm-Gg: AYBFou1SNpTWjk7fJsqspTqe0AdQ+da5d4ICGJEcEtwAK6Z+H2IYVoKnvMOVLV7xgt8
	A7TAYNxUKjZrWR/muz3OnFighE2kNzOBkhhfP1U7guVlQX/teo6Q2CQih92aw6vXJtEb/OpNtFJ
	gquAXsmrXgRRRiaRmrF/2ghAWoW1DMJRin+zTRlmFt3csFNgtQoD7+bbp3Bb+AQ0o3MwFPdoasS
	DWoBuiln/3g6GtzMKGf/r2xQ1k5aA7I3ctpwdJ3zNDSI0PmD2/+/pvI32mciM+8D7hGR2WxfqfD
	OYdR+YcZgBuJPlZkN7/QUyAREvat44nyPGO6unLY/1xUiV2nh02b+OBVb8X0uSnJO8p8jQMejXO
	GUdHI+FUNjFWwz7Jn
X-Received: by 2002:a05:620a:700c:b0:940:cdec:c867 with SMTP id af79cd13be357-940ef9bf00emr379195885a.70.1792873507391;
        Sat, 24 Oct 2026 13:25:07 -0700 (PDT)
X-Received: by 2002:a05:620a:700c:b0:940:cdec:c867 with SMTP id af79cd13be357-940ef9bf00emr379193885a.70.1792873506753;
        Sat, 24 Oct 2026 13:25:06 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f59750sm52347475e9.0.2026.10.24.13.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:25:06 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:25:04 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sm8550-hdk: add DisplayPort audio
 playback support
Message-ID: <e67ppax7mdncrk7jlty2s3yrih3sqwom6k2rkpfg5pmeudwinm@o2x4i4besp7v>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-2-8a189c71938c@linaro.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-2-8a189c71938c@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX6FjwtAbeJUV+
 arVoBlnuEc56o4IH9oxA47ij+MfJ/xzmtytexJfAngwMkrmFYSRJypjq9tfepOmJG3wtSeAI0Uq
 pBPmcCg/kFtdvk21vghNj2X9I6sFDYSaLEuIrWAQ0ksqFOACxJ8oPcE4AEmIVS9N3dMAXVTprGT
 sxu25ZBn0EZjC+Ek4oqvmthbl9UQWdD73tlmZXKSPO+fDi4zrfjmOJ3kOEVuKw+2wrp0BN28zjv
 xG6GcXch8Tqy/uhNzReaJabn2qAAtplTwEEliedlLS8Zsk4VlHrr5XbfSWGwL8N1veuki+l2IRQ
 9bTx6++35wA6hNiJblaaIvGW+6edMa7bVFHivKO0WXwnu29ikCnykH1VrnPUzPB+J/A6LOYAzby
 LQV7Tve1BBzk0imnmKxlhM3C+yNR+DDHpym4sUfLC35MpJvDwRYQ43xSipTN1eI8kGnMyXnuK0A
 t/0+G3tx9i/2kD/dG/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX/5wN9kUqeAXQ
 M5MA5hHRMsGGSdJNf8UJJrIJD/mzGZ5KB6dbb83v698Lz0TZVNrQpwZWrPTkFnOxS6HxKIP5bmv
 reVN3LQ963+LPP7bQWNIt8kIh9qxl5E=
X-Proofpoint-ORIG-GUID: Ut6OiCK41o62h5eD2XeSD9EJNpQyMVIf
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6add1424 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Ut6OiCK41o62h5eD2XeSD9EJNpQyMVIf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240081

On 26-10-22 11:36:22, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
