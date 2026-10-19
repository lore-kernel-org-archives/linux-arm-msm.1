Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D3D4C14F3
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404051; cv=none; b=bnr5T68emtuj6k5YqR6bF2B4M8/4iSB1VedjQ2CxZlpTzx0Rfak+QexOr3s7mR8lkQW+e1Gjzze9x0Szr3a0YJYo1k2qj/IUCaidQpYSQGmUfPoG8EKl9CRvirfOYdoCJ/ZMXEqS/LXweXqRAGvZQGH5a4hrtBQI/6N/jcjE5Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404051; c=relaxed/simple;
	bh=R70oW8LwphJ/NTsHnZ5ZKcGx+X10RwjkMGHl54tVw0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFjgYg/+QS/4e4SlzFbWyDBbGsqaRcdrGiWY8b+HGnKQHq0+Vh7Rmu92rddjw/clNYBJM9ZqTBI3n4XPL195/cw4MGpvPTEe16Ju4nXvVTwH/f6AQA9/dVp1J5teMCTcWurDM6mI3BVQlSPJc5HgaYlv5Z9s+C9u+5uSxTjduys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGh/M4oI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wr4xnlGf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGh/M4oI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wr4xnlGf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OsUs3305548
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n6CDwyChsU7mTTcnFRr5rj7l7/nx8KuKNscWAipG89Q=; b=MGh/M4oIvCZ0mjOk
	TfZSJb3b4L/Su0I113ZdT499+I57TqD/QGvNtLzYywPwHc7zsBDRrj4KlRt6JOV/
	sIec8yTHi7DrZdGUpq2mBKPFdQN53ASkWeUuWM6/WR6A84ttl3d1Z4w47+BC2oIO
	2e1fNPD16VAAYN7I70WXXMgaV1OqtGZYDk2G74d4uoAbyJNrdxpePhCnHaTZvoRm
	L8AiPFy/by5pgDPtDaOoVvTeD6QLKs3LnTszOiK96521Bf9A2DFfleLOO8NX5MEz
	QPnfblTJcfyLzxFWy6j/wQGYxTGhy0gMRH7ipiWI4X4nXfPA2Rtqjqw58mge/AUb
	UaGHOg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf47ggua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:00:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f1f2ecfso69575985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 03:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792404048; x=1793008848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6CDwyChsU7mTTcnFRr5rj7l7/nx8KuKNscWAipG89Q=;
        b=Wr4xnlGfUzUYAgtJ4vFb1CsSDKlZW6EB2pZPd6QXVLxB+Qv1wQCc3OCI6sKSb5VFnL
         UnoBuPfP4aQdkD3ZXQ68Y2Q7MSOQR4OPmmGH21j7Muj1Sehm9aPoOramBaH1gN30rCxm
         bZ+WRY/esJvsnPgJ8aeSIVXTuzPeSYVzSaz9f503sWCDT5thrSNT4cL745fhBnGguRWi
         FYWkslWGspHcKn1nihZ+F2gZ/HJ/84t7dTG2lmBSHs5YYz3uhH7JJx0/qDGGoYJyYq3d
         lG/leLjCgjs9oS4vIPhitVNnwcz7zS+N2mMi2h9ThXCE2221PzUIvjRvKSsN/7jOIyAB
         0zvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404048; x=1793008848;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6CDwyChsU7mTTcnFRr5rj7l7/nx8KuKNscWAipG89Q=;
        b=KslYW79jQiytMvRiIxJc8+2+SAhLWJZy1R/quWiuLW7Asm8RhOzSnFbFA9q4+2d6ok
         zmKJLmKth/jLD5lINinT0+dII4k1mGZz3BkY3Xr9dhANQM3OKX88xrkKJvfafucA+EO4
         eCRzloU8K7OZjJSaIStqejC8YZoU3j9P7LMH7GbDzln4K3xgfJm/g0uZP4syePIcrXqU
         FxYbSzWEHI1iehOIBDW/3pUeQED3HW0KNV/1ut2k0Ga2O9xzxrTP5gvBo33Twrk7c2eh
         Wr88XyARgFtOrZM8Smkmon0TRxXsE3oAc3cICxEwMUSctrxLlZf7cdYjZamUhVH4mEeN
         v6FQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFLaZGxOxDyoZsSsLd2vjZ1HT1xgtNjNkdT/uoo8YCLifx3iz2Mo7MP8gk88vyUHI7QFSYYkUB74AAyZUk@vger.kernel.org
X-Gm-Message-State: AFq9FYJOFWua2KHATR3rpXxRsFAi6FnT56EwCT9GC9UDehYOI0YOOTHr
	4ddOPFm0+wW/uv7ut+C4ziRhyck7ELDUH07DdWwxEwVxIP3MnoJ90Sceqoar9WsoNIXQK2LK4Wg
	U8MgZSUHpAX23rfKf57IJmDLSxdxmp94wtgkwmqgbzmjMqM6nmiqd5estV4rf1NTH2cOl
X-Gm-Gg: AYBFou3bNVdkUTBKN09Q1jGIhYjotr25nScJV5P00T7Ix+SstHonv+GI/5+l3o4dJAk
	K05Of0fY/GCjarWy6vYhMfwb/QkPUt6ml9egpoKS2ta545D6+M+IMRIPr/AV7v/iLMrfjz+UG72
	w6CBFCPO8LXsPh2lYx9UAL47GHjecV/2i9yAJxvJpJT1cDpNP+bA9VdNa+sg1UFNtXcrXrZtqD1
	w1/XSB3EHgwTB3OkS8HJeht/gFNSxMV+0SeJ7S3bAvJNWw3EqTELOAM174aMDGB9zFsPpH2TVVI
	xoWDELKxHOYc4UqgL2QAyg8Jcz0CLndmk8MHBYXJLO6h2686RRMJXUdwjB6TQ91WAFLiwpdBQB4
	QF0VktuRXboH78Jnt3dQwsA==
X-Received: by 2002:a05:620a:414b:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f29b98f5bmr1435655985a.1.1792404046791;
        Mon, 19 Oct 2026 03:00:46 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f29b98f5bmr1435619285a.1.1792404044185;
        Mon, 19 Oct 2026 03:00:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d6280sm3556395a12.24.2026.10.19.03.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 03:00:41 -0700 (PDT)
Message-ID: <226826ef-0cf2-4147-9256-d257c8272883@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:00:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-qcs615: Add additional frequencies for GP
 clocks
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ElgmnWUVkt8aoIoGNIrbqPbAFvkowyqJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzOSBTYWx0ZWRfXw2hfRolgGwmr
 5RkL/R2Q4j8wWV+O7UDzB+tXS8+jpG8IhuYmuJUvggA/92ZX64w/YrMvhdzOnirzQxV5y5Kc9MM
 9NTkBf+S4j26O5vTHhONJ179HiMgNAyfvxXB07L6u58m/5FtyVbzDVPY3eqJnKN3WUitLyEHJjo
 tDZKUraAqefqknUbPYUgd5aatZohFKzaLkB7KxnouIvUb95iDovquwMJMIdrWke+PlYrymTumoL
 XMVuoW1Og2hOnhftBlKQOyja7EdzXFhQpqiTkwj8U2FnUaC6xq9I+rTdlinxJA6WEgj1m6reN5Q
 TFX5VvLr38E8uEARxgvjA7XBq62y0oUZE/PiKS/j0ozVaGdqjJd8YUCed8h9Q6AODmZRYXoHMqd
 u1qvnc+QnZmXbgZEutQX97flLWZLH4dpZQvG+6OQGm3ctRxgzIFcejWxEtXR6MyZOODwTjiVS4t
 XjrjsYmYpQZSoV5Pccw==
X-Proofpoint-GUID: ElgmnWUVkt8aoIoGNIrbqPbAFvkowyqJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzOSBTYWx0ZWRfX/7IRG9b0debn
 GLNVfR93PnQqaB5zhFDYHiYtNOOSujeejy4JyVhDhWGd8xRdHCAqYN7XTlyhuecOsSzhAG0Xra7
 M+4USMptPCNabD2dVsUzsoxdVaoWxIU=
X-Authority-Analysis: v=2.4 cv=cLt1IVeN c=1 sm=1 tr=0 ts=6ad5ea50 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=r3KDiPLWR5a1ZHJE9ToA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190039

On 10/16/26 11:12 AM, Imran Shaik wrote:
> Add support for 10kHz and 100kHz GCC GP clock frequencies required for
> display backlight PWM functionality on Qualcomm QCS615 (Talos) SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
