Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007757;
	b=ASE0h5qF79ycdVtyNlkvw4kJSM7zk5oMdQ66JPjxqPvtXW96oaEOMFvaUbbZtQJTarus
	 HJTozGi9uiROfh+2XwYF2jcpec0YqUEWMWbw7dWzgmLNNEv5/zUOJIOaGcd2UxyfQPjgu
	 /rJXYlYkp7AkiApJD904B+C21b6YuxEgZKwPFOO/Iun/DETD+P2kHrC9HmrmCtTRSV6xx
	 phC7fffg66N0R80hNvYSHemtYO/yb3onmlP1qmrfLjEyhT28Dnjs5YVLOkg3dLxKjkVs8
	 YUmw6cw12AcPmGjfmDCChswqNrHwrg5PxUJkqtYZGpbIz7q3VCH+T6NFq9PJJwmss1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0GCwWFlC5mwyxuD52EKhsC/tATLlio6h2M9vOXP4oJU=;
	b=NHzCTwOJNaL85dYvgp479ZEos8SYvuBPZIygK9ARilXn588a0AoAxjpecIu/nxTXaDk5
	 QBYoGqSEOHk/EbwAHh6Iq8mzrmJXyG0HJEL+qQOaxSwudOwAvIVv49AVWLi589a+fyoDK
	 16NJ81fmrG9OEIa+XUcgK0ZXpmqQ1kPbp2UJrLyJfQX6cnfwpw9LGflbH3zDaDePcFhHf
	 gdfPnsRVQZM9mNwOuej3xk3S5OsFR4SO13hXhqcxchDAHugh+5QFAbDsUdeAYXP4C5hX6
	 I+ke+4y04+z8rn8wuXTv7ng9AA3KH1h9XXGnweKRpgrCcgoho8IvxyJhIYTlsweBIsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EY8DQQiu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g7AcP0d8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6FC606A330
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF6FC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EY8DQQiu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g7AcP0d8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b28I2206271
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0GCwWFlC5mwyxuD52EKhsC/tATLlio6h2M9vOXP4oJU=; b=EY8DQQiuujcIHHAN
	DjSAAdIRKxtBM1vFoPiw9TVlhAlk/BxbatLkUMu2bM7kVMk9fwia2kv/O3enEThf
	cBL8PzWZ/O3r8LrTCzEpYXxi9uHSxtXiYiSnTPkYCoarrog0ZSBgk753Zs4xRAbr
	qsYvbtx/tFpVA/vg0ztq+nhud1PDb3uN1IREQCyoqBN5KfVjFF3XKGTL27L9Q/Gn
	yhVlR8pHHlAjh6jGsKATx8pSurkmFsdFo4dmo46aIM9nCrImZlmCfuBJqrOQxjIK
	ouKu/A1BdiRpMR5x14nDzCpi5Fs5dpNsajOw3rnY78tfvhnJW+rggokAhn7Q490J
	hMURQw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrunrdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:42:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536708d1a3eso11949821cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007755; x=1793612555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GCwWFlC5mwyxuD52EKhsC/tATLlio6h2M9vOXP4oJU=;
        b=g7AcP0d8xdsFNrXxvUL+emdBjtwlEaP8+W/CsM9k6W50vaXRvzbLVZqJ81m63jsN54
         fGvBl+jR0k8xG2v5nzzK+OBsWFyOxBFyo+ysBaOGXkBjITnNJAzT/ush/mS76yMEMpdt
         xKLhXMqL8ee4FTpR6huYxDnndB+dWVXEMQ5WwWL3TuK6d/AP1z7NnY38ZytfPrR7UB8v
         DlYt1GQYl74e998zsqa1UNpnZcaYwYuDa/yxMgxVNdmN0QftCcO2a9u2bAKwwVY+i3z1
         uyHYIbyGwESXPJskmSZ27msaivVWZxUvmv9xKICdJAeU4BRTQNSjq8DCmEl/lb0Iu1xw
         fRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007755; x=1793612555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0GCwWFlC5mwyxuD52EKhsC/tATLlio6h2M9vOXP4oJU=;
        b=xD9erMYjVBfmCpm4URF45BsW2lNDMjrli0lxf3lHjlaNrLnDGP9C0P/YP+la44MnJH
         Q2uTlO3vd7bs9qFejtDWSkBsIDyiMxfRB8ewCb5Yj/uM1Pxgtsa0zaze1GmUEf6H36gj
         9EU1ES7bfVChH+OdU0hLy/1eBKZHtVUixgln4D53A3af3aXaYciGBtIgWFBvyeokdULS
         ImWG/g0ez14wjKnsIKIA7C0w40Vp6sx//pNn8+eL61XE4fcI4haxMlzbbycrmZcz7QZ+
         3W960sPRfMEXRBiQJf+XGTvj8Gtxuqf30+dA4rKhVbT4SeGW7Q2fXMOyAmGoNbCE5el4
         GkHg==
X-Gm-Message-State: AFq9FYLaelmhVPYH8Mg96B7qkyj6A6njgBPQEPUe6NG2vhfr+NClR32I
	WDaPyvWgSvJ97AU+EpDJoY2q9CvQO8wP8KCZl62QOGI9PXaJ4H7N7g0Ce93yux7YEUO/KDrzknk
	kMsZu2SozmPX5A3KjxMzsUw6cSnBjIwx5Dq1OhEGCMhrOTotUmxOhuJNvhwsm80sMHYDW+TgRoE
	6t
X-Gm-Gg: AYBFou1E6J+5Wvs01DbXl+5TtyQf2buy80Upi6DKwxlnTv3pVzuH94rST1sjTZnCequ
	4eVy1447FzSbhut9iVeA1jPN9SOGYn0iSA1R4HgnYQVbjzuvsUJQtytbs/ElMcTWg3G3IoJwcrH
	dcSIscc9HTyHEozo39hlPjTr/uHXCtkPfeIg5mZb/plrZzfcU2vC/jdIoQHftgfwuc/pKei9uog
	L14hbSYxYTSZ0xAVIup/kZCJ8YAMYBLEtznhUh+eJXuKuzG1qp6pwhNwnUVmFS7/DkWXGzIDv2N
	Vz1MQp0as7Smo/+taBaSQP4JbQpbWWV4JgCKTY0QhCsxE2LZNJ1tm9cY/e3iAuBeMhErxFPqSDI
	66AxmXLwXYSA9OYfHfejCjw==
X-Received: by 2002:a05:620a:a881:10b0:93f:1eb0:88bc with SMTP id af79cd13be357-940ef79d4e1mr938540285a.1.1793007755324;
        Mon, 26 Oct 2026 02:42:35 -0700 (PDT)
X-Received: by 2002:a05:620a:a881:10b0:93f:1eb0:88bc with SMTP id af79cd13be357-940ef79d4e1mr938537585a.1.1793007754867;
        Mon, 26 Oct 2026 02:42:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea3aesm303000866b.26.2026.10.26.02.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:42:33 -0700 (PDT)
Message-ID: <e41b7af4-42af-497c-8ee7-666fef354306@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:42:31 +0100
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
Subject: Re: [PATCH v3 10/14] drm/msm: tear down only a successfully
 initialised KMS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-10-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-10-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX5XwqbtLh6UyY
 M1ckmohft61P4Uc0QbIc8tjrFH+efbdQ4uUTdElHRb1Nfyp7+w1woGx6+Yqa4DLokS3T0OpVkpO
 UtwqjSNxTywyfkJh2PAOGAfZc/UVd+uTVxyB5ldMhooQONZIPIG65plHKMkzegwqJJHWPVkme5C
 /xMDzWv8mtn8J0IAF5m7HwXJriznaZLrE01kwaflY10TipwLiXbmiPMHcQ9JSSIctF0QOkzXbR2
 +fN4tSkwIb/ed44ywnxEg1JR26hgMSpFStGGEcbZo4Alq+Kr6CpGBvHanUHyZe+ajQEjZzde8nJ
 YSmH/Y2EiG9FVslwSjDHT1k7hmHEsz4fKE8CrzJc2rno/YViYeZlHILybFcroXSpac3SQ4xjGuN
 J6rOU4iJH7uYN9Dejpt7pcd4FO4TzhR8qiam1VyI8CtSOwrsAui1szoBaqKGQCYTnL3mZycRwJL
 XOIoHsRZeikqozasvdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX1X7joi8SjF/k
 F5UHWde7hrXrD+m00UjYCxha4lXMw0IeYGdT4CDIYJUQqb9ngnmY4VV+rHFOgLs07TPUaaiHmmd
 3AJrA9EOk5YlIKAmmTHboRsxIE06MWs=
X-Proofpoint-ORIG-GUID: Wt8cJLVVH4iGGYFD8gDLDcPEVmNy_UGh
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adf208b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-n9uno-3Oat8RTozT6UA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Wt8cJLVVH4iGGYFD8gDLDcPEVmNy_UGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260038

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> All the kms drivers now undo their own failures in kms_init() and have
> folded their hardware setup into it.
> 
> Drop ->hw_init(), call ->destroy() only for a KMS which was initialised
> successfully, and remove the flag which let the drivers opt in to that
> one at a time, as well as the handling of a half torn down KMS in
> msm_kms_destroy().
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
