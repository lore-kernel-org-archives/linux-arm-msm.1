Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A3335E1D9
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 00:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784680612; cv=none; b=rNsbRydZ/YeJ713DyYgWF1Y/VGW3YH/Q0Pp3Y8nDiu3jTyJU7oerdIewzOwUn4RhdOm9nupnYIqXE7FrpKI2UYZ/S57UkOrVgdLe7aoROLeB/qBwfd3JOa1X1mhYhhkMXZMSiBG9SUQ0duEEZfClhO/KwLLVmo9R8S0vrgMjauY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784680612; c=relaxed/simple;
	bh=eJ8JKhRAM+lrV0X/mYRJgYL2FI51fbKtrmhXLkf8Fmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0tDHFuZ+Xj4mf7zIM/u7N0UZ/eeDUwoNfAQJ4DG4t7bPS+CpO2eRCQuKLlfYEoejUxyLHzS6V8vqZpNg4HWm/TRdVY+Ai6HYAP5wObxoJey3aCYarc3gQtJOq8cD4x4rE0ogui+9E1DxJukb8tHAjD/+2+rBLoyozVfnoHKH8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+//bsBP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SKxsRGxC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+//bsBP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SKxsRGxC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZ9eI3185296
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 00:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MoaiRsvPSa+MaxPeUK2X2xox0h/hrgZiaf/Vh6GQPzM=; b=m+//bsBPbhXIRG4R
	3mDetjJlxu7VSiSuaW70Vng7LSPSuLFdl0vzsXsklrdBEZE0vALpgK7E/QWU5Jat
	Fvevnigr2TJZaPNqOX3HXtsg9w0ygFUyxRbWsYf0F1ofaWkPLn7mRLZMUxVignqC
	aCG63kZvhPe+70qYDocfYPenBJ/tZ9vMEAUdzcC+YUhxhHNFYMTOAnfSwvfRn5cc
	FNcTmoQMqF2jBI8ao6dBMY5xfFPcVXaA3+WwZ5Q1yrV8NE5UulJL9eOq9f2pbgYr
	AeLv5hUc1rLAio/rSIaOJi8rAeApKzLqVyE1TnI+hrbgIDpl9E5H89liw7b8h0pI
	RLZKzw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d9fyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 00:36:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5276aa86d00so13161281cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784680606; x=1785285406; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MoaiRsvPSa+MaxPeUK2X2xox0h/hrgZiaf/Vh6GQPzM=;
        b=SKxsRGxC/NYtqnIQGpbsSoj6hsO7RKiYpjcvJnGO0yzG5s/ZLCOwn/3AQZbxKU/jFt
         ANte3zal2GuFR4L5fN+AUkv3zte0Jm8sEJRrQ4j8eVVM75h51m5MgZAjgSdNeeyaDPfk
         NzzQ2L0lBAzU7DVckAr2rIIDHpv12IGlErJGlZ4yMCURpDX7dlIGfQ2ft6zUeMw9E17y
         4uqGXc95L9n/DSBlXax6GTJTZ6xv29HFg98YCcQxTa4IDzEEyceE1mBFpVAxXVtKRdLL
         iFGKUbqWZ9mAB5MSFs4Ukg0sMEIA2y5IYTJEZWWrM+VFbyge0Z5uy7HdIQgVnrWSUY8H
         VI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784680606; x=1785285406;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MoaiRsvPSa+MaxPeUK2X2xox0h/hrgZiaf/Vh6GQPzM=;
        b=ipbAuUCGpD2//v6fR71hopDm57bKjPaV3Rq9/YOn/8/yTVdupyfEkAq4p4T6pwHZZJ
         M/H9BsP1WEn/U5pyY6dGmQDGwcdhdcV0ugINNeYgvNqnurMr6dcJIAH0iIGbAwMCI8nV
         /c20Wbsh6yw7k2cLx/X0+8djou3+lhQztjC/vX1vxjX9WmwcJdV21IidKM9PYNQ5SvsF
         ZSgMu24keP8IHLiNVTFVVWXh01mEYDLN2dAyzC1dT6VpjDbHdmkuQXFVnf+MTnCOfs/f
         oUy5aPlKXiBzXmcrspaTb2Sa/n9GSHoRSf2pqZlyEbm+ot+U4rTFk0COrkYaAi4G9Ib6
         xCCA==
X-Forwarded-Encrypted: i=1; AHgh+RojTAVY/P2t/p94FVKCM5hrOMUwXZRtXPXtFWTegqRWPuovi45EDTUwlqCH2VnlnvsCQIugtcaKV6eC2Qa/@vger.kernel.org
X-Gm-Message-State: AOJu0YylBkgD3xYBz5u1c8CINg8fNKgO+eFwGPfV9WK1Tbd0veLenRZk
	6t5RN8dhLvHgbyFZ0hI+923JAxKqAWlFl+T0lbuqVgMCOgWVPYOeLQ/gz1Scb3GzAY5LSDZsQBk
	0kLU8fr8nxCs1m1/3+ypdjwoUa0lcAIZwMlJaKPFzjyT3eh0QoCQSXd4aELAWSsEG0bmg
X-Gm-Gg: AR+sD11p3sJ3kUziKZkWo+1wzTbDjPyDjQa9GKeJt8AvO6fCFRCxgNTvuWjDLlx7KUg
	/jYaB7bcvv7Ncv3Eula9aM2xJ1SLm16LL15yvqsazssnekYsNq8F/W88ushLdqbr2YNXJbyXKhI
	DYyQrl+hFyKjCQ9gDUswz3nEFRCER7Sqa+Hqkkj+jXHQaCQ80SLuMYg+XSoqCcW+KkoNjxoePtJ
	/RtoG99cLEtWqCqZLTF08uvkhciQGU7VEqDqZiWQPYj14eoQ9UKTNz/J5mqey35C/LhoX2BNlJ4
	csixBfCywI3asN/bTS97fNGru4qbC2s6w05r+36bl1TjdQQV8nLqx7YqJR2es2rSNhTovbXNmNn
	GC4rNQzja5Q6SlZRP5toRTl+7YC6zafY398fo1t6e3P/+VsNmOjQeQDlDB5clvmZZzJ4l+fSuO1
	cyYrQ3pbMG8tW7mg==
X-Received: by 2002:a05:622a:e195:20b0:527:f5af:9e7 with SMTP id d75a77b69052e-527f5af0fcdmr4750401cf.51.1784680605934;
        Tue, 21 Jul 2026 17:36:45 -0700 (PDT)
X-Received: by 2002:a05:622a:e195:20b0:527:f5af:9e7 with SMTP id d75a77b69052e-527f5af0fcdmr4750301cf.51.1784680605534;
        Tue, 21 Jul 2026 17:36:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d30d9asm188103e87.44.2026.07.21.17.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 17:36:43 -0700 (PDT)
Date: Wed, 22 Jul 2026 03:36:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/7] media: qcom: iris: fix state-change debug log
 printing stale value
Message-ID: <duesueok5bwy7rh5bdjyt3l7lfojjjniz7zxq3z6fhofhkxmwb@wcad646c2vlg>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
 <20260721-iris-code-improvement-v4-2-4395bd8acfbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-iris-code-improvement-v4-2-4395bd8acfbb@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwMyBTYWx0ZWRfX5mvTh4HMDZs+
 7q6KnV8c/MZ+WC38xWOTXy1M/axp2LbUpcKbREAz4AcBhNJ2kZHPQx3PbIR5weiRwOfanzUOyqN
 q6fE/XGZFyqz3hE5kz/1n1XgQfeXPE0=
X-Authority-Analysis: v=2.4 cv=Ipsutr/g c=1 sm=1 tr=0 ts=6a60109e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=aUN2rSNV_P4ZXYKtj1AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwMyBTYWx0ZWRfX2YVjWHIO7ryJ
 dxN0/D1MitY21iw/LOoN8Ffr4pk5lJzVKyuJqHYGYDWzw1qe/O9Jke04U6fwO7IEVFw/m3Fv3dE
 GAOGhGDeOYWEe9q+VCFQXq+xZa2e+zyP4jb1hiJFPLRv+0r24M0+ZJn3o+0Yj2t/oeB6YzXScAm
 NFt8Ggah0SEiYpymt33qwC266Bz7hoRmELldhhVV06jDIlYgd9eeqSFe5+tE1tLYtXno3ys7j6M
 ePgvateEZ/PUlzqFNTIWwcQJ9BUji4iT9rZn4wshiUr2aBKcXoujgBuULzGSc3YmKNS2udriNeE
 SuM2ReyRSRrOGLacQOeICee43NpOdJSGxFMCK5u+KiZEF64KTgjqFoUXnDxZLgIKkIvuwn5IOvr
 kmMhi61LFbpGcqAOW2kT/HCUnVwEFt28rxcu3Grbtr04VF1ho+PD1imP9s8EAzpb/keivkEmC+u
 0GTBy4b1MY0QkKfzFUQ==
X-Proofpoint-GUID: FyRrIktrUyWy4POo4cwNUI0oclbSF7NI
X-Proofpoint-ORIG-GUID: FyRrIktrUyWy4POo4cwNUI0oclbSF7NI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220003

On Tue, Jul 21, 2026 at 07:50:35AM +0530, Vishnu Reddy wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> The state‑change debug log in iris_inst_change_state() always prints the
> same value for the old and new state, rendering it useless for
> debugging. This happens because the state is updated before the log is
> emitted.
> 
> Log the transition before updating the state so the previous value is
> preserved, consistent with the existing sub‑state handling.
> 
> Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
