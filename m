Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA9C344DA8
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784688147; cv=none; b=Jy6TSUpzV78M9GRrrjIAbeb54uOvjVyj7tkfnSyOxrc+aqprUFaKRlU30rcG0xtzXJ59PraD9aJXzGIQCUKa9B1kcNq+qvz9nNQyypyIlNYeeuA4GRkrYsYGvRd+23Q7uUjnj8u9DqpQKTWYgToG8+4UIMojjZDXd5EhYg9lx7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784688147; c=relaxed/simple;
	bh=+jEgsXPIlpAf/t6BKT7RmtRHh01YWYWKVlVQ/dPgotM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFbzj+EL/hYlhpIC5VquWr9c8xMtDYhZHNVhB7/Lhwn3mTL3zyXBXf/nW2Y8tKUM0pzz1kK+O4FpiXgKBtCndI10x6S5usPoq3NNJRkkfCfCKa0IjSHtv+ysgGHWOKsMEfD73KnjYrZarzEt1vnJSgQs5xeoW8rZkQ++CmjR1KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIxlisE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQ6SbIeG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIxlisE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQ6SbIeG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CJwH334847
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yXuAeo8pGEzyDVWBXPKIatrC
	tMlfuBJ15P+LipzkFi4=; b=gIxlisE0cD/uz3lZAwRj4vD5mCzi8OnjnM2qwHaW
	93hpFeQ5P5wWJTuMGbUE28kS9rTI6lDtfm63f0B/JrOeguaQyb6hapGXLTg49jXp
	uWXtMeIjLHnMZKap57wlSCsKOCvmK37HcT5QETO8IHx8HpC5nqdYN9h3ZcfylEzm
	GQEtthBedRIB3nEfLwatpkml9ZZR8+zbWvXWLIdGYhvW9YmReiAQkUJ9aVI6grG9
	Xk1BsjYaQCRBJ1ePYTKEkyHhNXxYohJxgKXzRrGSY61APouVIwmTqrU3Kb9OIybg
	0sTmu0k1tEFeCdgy5lxnipoM7aLlRSb3TwmGKvEiQ4czQQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsv0qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:42:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cea6a46766so186152345ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 19:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784688144; x=1785292944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yXuAeo8pGEzyDVWBXPKIatrCtMlfuBJ15P+LipzkFi4=;
        b=dQ6SbIeGyi+Gomrxu67Ekw6qdA+Grr7fxta4K/r+3565+bv1ZeZhFsn4xY0GNlt3Tf
         g6W5fx8Ol2o4VSnRIqZIPzjnGvllN9JTikV6eAbTXGSzYKjzJ6KkbOuGmZwiGnWl3Yaq
         94et9DP6P2Xy5jKCbJVRExtO4pVFzedREID+p8AJl7x6A5xMTRFy+lRGcvyhsVkkFnr5
         p5uizvnrjY9h9HlhPLy81qdpVfkVtHBMEOq4Aw0imKMKXvNMdAjBMHIuVo6iIbv5hK2n
         +nrXOUq2jXb+hT0ireqHZVRcIvV6VmD5Yg+qrm8gGx3quuQ4PRFJrJa3GBkxP7zLuhkz
         nAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784688144; x=1785292944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXuAeo8pGEzyDVWBXPKIatrCtMlfuBJ15P+LipzkFi4=;
        b=Newp4sQdddjAtiGzUkFqnO7qYLWjrTkUp+KnZZlTm1DxDKYgaVpgXvH/c4zySnUMwN
         b6/6kqLw1CAZB/EEFcIbhzpqjJMzC8LCQl3/t1ROunuAAaRv7XvR01cxG72+8VMSNb1n
         gtKmPwUxn24tNwWSeHVOFiMuh/Rq+Hiv4ea7FL64ks4aclvKqE/1ElS5KeUypVliwV1U
         qA6+mVh/w9A2YItsXdc7+tNdVCb88rkjB3u0Y00xgB/IrZC+TnUdozLWk3WAQfH/MEAS
         82RnFc75HjOctBn6bgIIirrVnzv6xX7TSSckG0mJTDTKAWoYBJDboafuFS7p1RshG22n
         seJA==
X-Forwarded-Encrypted: i=1; AHgh+RrVU6eKEdEFKfSKqTinneF+DEGkF1E3pkXU8EXPM/JQ1hgyg8RamkrxvCy4P+k/HgX/OfZ7ZmlWEDWNbp4n@vger.kernel.org
X-Gm-Message-State: AOJu0YzP8U9CTdjX+Qa7OmozNYJ7gwpWCRsHd+wE2XdDWsCmnmg4iU/i
	lWc+NBJL88IFf/Nb9FruOKWgYFEBoVP5R6+t3mXP9clLCF4T8DXiobeL1k4xShceb05bY0ANEpR
	MpTDzmU7cQ3+Z0TVEkB66CeI4FhOEzVek4DGV3Uw3a+HWkdl9wU85mhZCA1CBNp3JAuQ4
X-Gm-Gg: AR+sD13W7jdFea39+IhbUNyIpMnc0QUpMmtkEFZRrwg4FK8yZC1ukKj49zzldiVFD/9
	5SYgV5gSKvihTJQiEQa2Dl+UwYwM43+J6x+fLf7iJ/IqIK0CowuE040T1G9tRzVsoMVOIn5p5Lx
	u/GBw0fVuwHdu1yS+ZWq5MCIq4gdTzVQmkyQYvXz5ttpaaZe6OaQHItUkGKVJMRDbi5TffFRq41
	k42MD5UlGnw3+k5xTCJpgC+r0WcewkbjC4EdZNrYr0mpv4YoGNNfqWpG9q28hQTfVxiWiRHg4DN
	UH8LGpGT3LXzsXnome7aHwfgk/tM1nzSOJmyJK8rj2xaVDSwE0EX7eofA/YItigKdCUDBgi/5HY
	MA4nSY/NdNhyTttnJqxa/JNXZ9KEq0FAMiu0o1Ccwp0I=
X-Received: by 2002:a17:903:298c:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2cf34a7bfe4mr225540105ad.43.1784688144368;
        Tue, 21 Jul 2026 19:42:24 -0700 (PDT)
X-Received: by 2002:a17:903:298c:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2cf34a7bfe4mr225539865ad.43.1784688143966;
        Tue, 21 Jul 2026 19:42:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm3868069eec.30.2026.07.21.19.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 19:42:23 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:42:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/6] clk: qcom: gpucc: Add Nord graphics clock
 controller support
Message-ID: <amAuCHuElKhkoIfM@QCOM-aGQu4IUr3Y>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-6-17e5a445a512@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-nords_mm_v1-v2-6-17e5a445a512@oss.qualcomm.com>
X-Proofpoint-GUID: mkTYMWaL_1DTfoRQicf4y8VSPgAyw4mG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAyMyBTYWx0ZWRfX14BslRbK7UNX
 8aZOowu0EZddfgepEFu+CTNtIDFDoehpQgQQphEV75NdiWEvsnhPjlnnNtqJt+AlsNyyHqNE85+
 3sPAj9lF3eQMsFajEns+godKRvMJIZU=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a602e11 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=cQiK_xN199hq2pa4WXYA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: mkTYMWaL_1DTfoRQicf4y8VSPgAyw4mG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAyMyBTYWx0ZWRfX6oJY7h+wLltj
 JOY6aX1QUs60aGQFsKxLtXvRtJRR4lHQf8P9IQXdhAzpA5knh/6UZ4tZwFq79kT7zcPaG7JRWux
 N3C5B7u4fm4Xv9i8gLRhgAl33t06Dg/ztOl8C2pYBjzpQ5Kfh1VzK6Mwdz0cOmH95TxAKDYQV/h
 NPiz+eZjeLK91jlHE4eUB/UcPzbUHeXSdeHK9G2zPvJcHz5xRCMvTnwWzDHhVvxhbGEZUwyM6dV
 dVCUUQ7dyqk58B6XTUoVptr3kNldfxJQxDlCm4BtkqZ5SWdIAGCgOWFoTtBDXyzEgRqXBxPzo0D
 ju2WMDZSfVoMIUc02MovSER3RnGUbqBhQn98XpqcfUChnafx5MFqrGNeBihIlRW++SNCrKllS5m
 ruChit/FFZbXGcwmn5UI8Tx3VUlo8d5raNRuxLbtM0x3gwsGar/4MOOyMcIOkjmEUxyXBa8oQNJ
 6ZTCgzsXiu6iE7abDig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220023

On Tue, Jul 21, 2026 at 12:37:21PM +0530, Taniya Das wrote:
> Add support for the GPU clock controllers (GPUCC) on the Qualcomm
> Nord platform.
> 
> The platform includes two GPU clock controller instances,GPUCC
> and GPU2CC. Register support for both controllers, which provide
> clocks required for the graphics subsystem.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
