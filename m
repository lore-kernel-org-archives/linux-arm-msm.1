Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006361;
	b=BzKQLI+eUWmz+0jfynDcp+YTxkyjaGcTg0E+Rr0Uzzfd9HgwZG5eU+1GNtljGDrYa4du
	 r9BaqzUu7M/ckJ70lExIc+8j5WiFmA/rlQb7YgZTYW8DgcxMcSe003LEJe2GMU3LFUgSB
	 q52gM0JyfJL94vz9Q/p4kqmabtmfKWzt1T15TBRaBvVkRSD1crmIqCAUAETy4aOyZn4+L
	 239bwCpIzr51XDB1uivfZRAZpEkLebSwOE1PGdMvFU66uSnfWf1fBXnKogc0P/twy/uPf
	 tWZBau+G/w4QBFQdQYWZpc1li5jvqbyvlm3ipsr2fZpYC/HGjcEJTlGORSDK1bcJFSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006361;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4mPhZDRt9QlLUW4y6TN1ZMTZKVwC2eRdbQhQ0HjWnJg=;
	b=adneFqaP83BC23+1yCTZhxoQEYR2KQw7tDcM/gfNABgT167E2/vXmbd6qCorXbYAB85m
	 RAdKgwGpcjwmOz8JAu1Q5h/FwYa8qoLZFuLKihRBneYHJYIRssI/NbHxQ8GLUkRKlRMdh
	 Sc3YxDoQ4d7+IJtTgXgmeHKunJwL9FQ7itQsYTVNZz57Bi/M2ebXpuASHaPQR0lwEAIfn
	 YcyO8ISZGl3er4taIyZ8hDrvSpylmwpv5glJ1MbiEKwrwffB/VR39s/FbtOtga1VhtF6U
	 Oo59ZjiHILOgjFuJfP9rkJpERwgeqLi2no2mZltVsj1nwKYAeALcBrY5YSwpEEzoIaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIpHX3Da;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GQKWwKkf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692B2606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 692B2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIpHX3Da;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GQKWwKkf
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b6J81907790
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mPhZDRt9QlLUW4y6TN1ZMTZKVwC2eRdbQhQ0HjWnJg=; b=cIpHX3Da9S+jSWxY
	RilXb0nVvMKz/goG/S3rI5SZ7QrT6mo0KtNff+tblgqr0tnSrN7wJcRjU1fwhdfY
	khWQ8UCJCLaK/cp2wUYk9Sa5sUhCwFKvQfed4h3U9GhdYuo5Qg296Coe+TxwCrxK
	wjIV9dwknhWvm5HJBZGz9GTS26Z9bJj+o0NlMP44p2hdoHj2WGQEj2iMzs1+b8na
	gQK0j01Gn2ZXEty65PaqqeiICLewMfsssm56Z4JgX2bvQflon+2vkKltJVSzt915
	eNZ3vPfgBi05dUMwDrRi1eBWnPRiQu7SqpMBKKv1bf4K4XfaSyHM/XmLq2BwYXPi
	0LWItA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gnqyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:19:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5337f843b50so1998561cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006360; x=1793611160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mPhZDRt9QlLUW4y6TN1ZMTZKVwC2eRdbQhQ0HjWnJg=;
        b=GQKWwKkf3qzcTtpDr+13aEKkoLCHmlW1e7Ha9d8AqEbeyFVG6TT7ovtZ1JNaUyTs76
         pePuTA72XzG4yw43igi5vYeeJzJEmMngqG/CL4nYEnL4jcowgUbmy1binLmn9AVyKD0a
         MFWnf5kKayXsMxlohA48CMKIfs0kbRDTVrU4xM3Ig6TzvxolZVO3iAJ1t7/2MA4cU2aJ
         1U9PgXZ+RMwMTCwsj0oUPXoaiQ27jyGFYIKp7DfkWw9q43RHyCdlGhGWLXwzEvebtqVp
         IoOwHAJvqItAH+Q9/jtOp8polKQxowOAjKCJEfcp6m8hDsSoH8cCj6Pios0qHIxPUZ9L
         PLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006360; x=1793611160;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4mPhZDRt9QlLUW4y6TN1ZMTZKVwC2eRdbQhQ0HjWnJg=;
        b=Fr5E9cQ/gnJXCWnp92xXht5E4onwYwbvbSK6ULO9EDAjkOlP29y6Nz+3cJ97/PoxC2
         qSrVGU5eurpTxeq1eeF9P62k0TiU5N9GgTs69dq8eKIp2TtBmBK2MiiDYoqmKM2wYR+Y
         Xjc7GZ5YvE1bWJmj4Tf1s8fNOWUFT8cIzlAM03U0R5tdGaTjSQFjj3e+SreeVK4wDYea
         YhC3DdoHNbuNp9noFGXbZ2f7ww5ArMIeMWc7uRl9zSwMi9JEsjEeVJOf41FxVSBxP1if
         tX36JcVMU9oRNn5dfgfwevl/yG3qhsdMU/FO0ASRzUOM1ONrsQQei6juvM4nJYy2TfMu
         4m+A==
X-Gm-Message-State: AFq9FYJo7WpDtn9DH0VUJ28kbZVsutjsb7L6C9N2MRQO0vWDNsJBZmtT
	VF4aLjvPJD6BBRlmw0+5GqzemqW5efCuNH47KX+Puk4wIAxDPfb/9GXVkcsCLYuEM/sCQKHzQRI
	LfcfucmKUnA7ekx06R9fhErHMPH7cdekok41lr2BqDxZBCkjZXaOcXPVtW0aQHuQIMHTE
X-Gm-Gg: AYBFou0NVp4NMMNBRRhEmXklsRgrQ4FfhPWoDz5cs6Lt2rUZl5dstims/nA4o9nWKB2
	w8x0q8XZ7dOeGGbi3Mupekj+EikNyjRTg1fVzkxRGBo2Q3E2h3ikN5E+LKAu6/BFG5l/pFjUPEg
	hxOqScGB95PuLUyeWtegmmHHjctw3jlRyhJKqwdKljvxj7wfMCpC4PWvi5DdZOWPTKjPyeWKGQX
	C1UkqfxiuLw3yce4gcSbZNqkU2mMtusr+KfTVo+YzAlh/+UGmC45dXHfQiQolfOy6b2hILwhFSJ
	0TzZCPeB18xmgI11jZfKW0zYxcsj01iQ6sqBqLDr8wAJBPvO4WaFEWLAXXX+/c70vpCWWvF8qya
	bz7oOqVjUgNevpg6Ooim36w==
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr885092485a.3.1793006359753;
        Mon, 26 Oct 2026 02:19:19 -0700 (PDT)
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr885088485a.3.1793006359301;
        Mon, 26 Oct 2026 02:19:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f95csm299862866b.5.2026.10.26.02.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:19:18 -0700 (PDT)
Message-ID: <dcf8619a-29c6-4ec7-bb98-fc9dc705b064@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:19:15 +0100
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
Subject: Re: [PATCH v5 10/10] drm/ci: mark pixel-format tests as passing on
 SC7180
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
 <20261024-fd-kms-fix-smmu-v5-10-a5b0b284aead@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-10-a5b0b284aead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YXR943vO94pLcEvU4xir7f88R9ajQUDi
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adf1b18 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FX_9VyN8hJSf147S1HYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: YXR943vO94pLcEvU4xir7f88R9ajQUDi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfXy2+jMqDa/eWt
 Oi1bWwyexMumy6SmkdCxbffeqb1q1O+1aVskJI2zmkc7yIqwTwTbWR2L7XxJGdMko8em2lUHQTk
 XAMR8XDJmRoGurB9Ytn7QrCEgOJ7MDSqr8DdSAQD0cOFwys7KPY7/zx7m0cYf4jAGA7HjvoDunJ
 yMN+8Wcni/JDd1RTOg0qLcVNyB93LSgs12WAi1E6VZ8p7LJMdOwdLPPB7j2TWBhz5MH0H12P2kz
 a5P23bPqUyNzw9aJFVBz+aytuBXJ3NHgR6Zo4X4ABnhagsHwtrmkjcUsZkJBhTE2W7pwBhXzWPw
 OshEEjIOD04JK1kOKD2bF2NqR4rIvv+4Jl2bX82Q1JZ6W7J4tjmk4CJ9f0GPkNHBFO/l9mByjgt
 Y0tP3/xVa6P2XaEKml5asBVjVFOy4mas9LfDSreRy5r+h/BOedU94b2vH0SbgYf8PxHuSXmtOi7
 FhfAhTWcEFA0y+UVpkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfX3CXNOUYii/Sz
 Zo8hpe1u4PXOpjCvYvTD9x0j8LwmqbSI4CJ3oa/t5tL416mWRYDR/JXO1inRINJZnyDrOyFViCv
 F4FCosI4LFKdAP7UZCnaeTzwnYHxuM4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260036

On 10/24/26 1:25 AM, Dmitry Baryshkov wrote:
> kms_plane@pixel-format and kms_plane@pixel-format-source-clamping timed out
> waiting for the first CRC once the test had set a legacy gamma LUT.  They
> pass since "drm/msm/dpu: only reassign resources when the encoder is
> reprogrammed", so drop them from the expected failures.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
