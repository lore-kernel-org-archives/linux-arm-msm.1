Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57488480975
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 08:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842703; cv=none; b=qGGeDmXYtvFxuxGscZOPpoy/lBR9YWucnaf/IkR/kO+NCLTsHI09YFvSr1bliOQmkVeM9VCo5yJx7P/9N1bP05cQPilhJovAGfv/KQoTUu4m9IukkK97W2jFHHzWZsqAxhRXRP8roQdV5SJnNoABqvkfu/K14QZk5fReDAgpSO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842703; c=relaxed/simple;
	bh=TCgyohw+AWQA65LOgmWJUJD1+H0EpH84h7CrghymCRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+iyIh4ns4+Izks8ppWFHK3bn59TFLZVSSV9jwK5CZwSY02Ns6EsO4u5tpA2ydjg9C9427agA/iFex/ts8sYEsgWkJ7R/4BtoXwOltNPzD94Bn2+b+/EdE48NtA3dpQaLK39OPhrBzHJWbZzorKXemA4Bpcj4zX9RNfZmtmgOeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxsI9T1n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSo4XEZC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxsI9T1n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSo4XEZC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xTBS2176855
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 08:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c+nTuG/oT3SPYUz/JTYbRb74HGriVI/q5a/7xYNgat0=; b=mxsI9T1nT6UlPJ7d
	L0toRWkWgqvu+yU2LqHbKXas54o3hi82Jgvz+ouaySdnJ0Z2ZAp6ceLZ6JsuWP+x
	0wOnOmHGTH+n+SOIJ8Soc2mOFvYW2zP3ns6ftqC+gwOH6DjYQzZvXu08WSgDkEiW
	jXk+UZB016MqQzTi8V7g/R0LnZWh24YP9P/56BH6ReJVixG+kyC7QVti9fqYKyPU
	IwFbWay9EouJHCRplPSzvXCR8AM6ASEoJk3yNxMXRF7q+z+iAuvreEyxnSMlG9Gd
	uaEH7rylMXhI0o0ZFUz9Psk0HnwSkaLW42ce/X496luS5BQM0pU8h+3/j4LJSraA
	WKUg+g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nrn2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 08:18:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc19d8e59so296485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 01:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790842696; x=1791447496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+nTuG/oT3SPYUz/JTYbRb74HGriVI/q5a/7xYNgat0=;
        b=dSo4XEZCRuSlFz4SFaR2Y7uROn9zER4VnrtWZUmHh6XZYlZkH8MWaN34UOcL/tqnbL
         edsmVT50rRGtxr43TH5glf8F475hrDtDDCPtjs7qrbbLQ7k0TNoUXExVPZitjVz0MnfN
         UqZUtLx8B1qY1fsnU51DymaFxHXZ3Y5W+6uYGoKBvDiCEkkjoPr5Ai0tirdxbx4ztUae
         1XouzrIhOn45FIkTTg6+IDFaEBIP3UVzMJQ5MBS+8FiEhMwxJG4E/AVIR8oU0Wj4Dc/E
         0hRWSKJh7/4XrH9uj4DW+HOuPasL1tzcPVaWjJVoDZZtM83THdIaqekJu+15wLR5DfYx
         rO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790842696; x=1791447496;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+nTuG/oT3SPYUz/JTYbRb74HGriVI/q5a/7xYNgat0=;
        b=zzy/ul3Un/lXKJX3RAC9aCV3zZkBkqQR9qY79860026UKU8yjKYLDGoExRv83igyrK
         NROsD6m5L4DUyYkc9tm1aBaWW4Uws2a3KFUG6b+Wave2j8SA/KgO+paGImHNqxwSUJeT
         loqP2jo5ZKECAmBeYtHl2chG9mPplFz7TmqJLfZ49Fh8glXsiBGsM9lE84j7ioZcevNg
         ZbNxD0dOelvYjjN01ICjS+kq+KKyPo1iDFThgoYwrKDPd3EcT7e4q90K7I+KEOoc2K/w
         IT/Rz+3LITpS/l7PiBCVI0DUBS2ePw93vmuix+BQDEKVZJaAGxM5+qQIvvRxLi+ONvx7
         sIBA==
X-Gm-Message-State: AFuF++kQinOpCOu8x3xrrS8zeLm+gzQmttLuxo0VcCiAno0pRqH1ffTI
	XiTx5ViFQvc3/ulIzGBB+JLMuG7aT48Q4ulzT5tv9QBa5Bxz/FSnym7ZjiXZFm7Qg1dz/vNxYV2
	cgHm3bb6Z1JPT6QhjMo6tQk5EwQsLeEcjy7bfmxGOH7gY3uE7zB2/kdZ6T4BNZcKG7Ehl
X-Gm-Gg: AYBFou3wt0L+cgHjdc+Zv6fbGLVbq2i0NQgj3ylYJ3Yi3Q+CgOmcWWYNWF5kmGmksiJ
	O01I2l4Vow0QJG/sQMyRn2yXD3klxFzAVVllG9vtc4ts7KRO/0Kc7+wGNzFGxNXrJ+riWhpo5Zs
	qW7FDhVT7eSoXHyNeDj1wp2ry1ZPJXxo13XCQSWQjuIgQIOCo38T6ZdFRhKUD8YBgQb5/o/5Ymy
	XVyxfQR0DfDEdYi3+ypDfz7zYx2SDriCdqd+kkvVWf5I/UCUZanL17BCFHHZu/8jx/2o2MlKU2o
	0qI1RFRnbG8q3vFyKcky4R55IgVs/f0dngUzLQo86zulCEmkJYhZFt4P293fz05K0hgHfWhusc/
	BfvldlpMsTHWuD/IYOYIvkA==
X-Received: by 2002:a05:620a:260d:b0:93c:6e1d:96c0 with SMTP id af79cd13be357-93ca96ce16emr736925985a.3.1790842696273;
        Thu, 01 Oct 2026 01:18:16 -0700 (PDT)
X-Received: by 2002:a05:620a:260d:b0:93c:6e1d:96c0 with SMTP id af79cd13be357-93ca96ce16emr736922585a.3.1790842695754;
        Thu, 01 Oct 2026 01:18:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae5ca537c3sm631601a12.15.2026.10.01.01.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:18:14 -0700 (PDT)
Message-ID: <801e79b4-f45c-4f23-8b8d-5ac301d77e9d@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:18:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-x1e80100: don't disable display PLLs in
 the unused-clock sweep
To: Jianfeng Liu <liujianfeng1994@gmail.com>, linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
References: <20260930092904.5222-1-liujianfeng1994@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930092904.5222-1-liujianfeng1994@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe1748 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=woKDG2bF4vgdl6vZBDkA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfX4XhyatoQ3N7K
 PFA0IXPsFXwxbz69zxYt2hudPl+kh8Xz0WU/vFB3gfbVOpfKWXBs1feDcOv+61y6bJlfVvRZgos
 9ph1kMwKcl7R52yUKaokco2nNIxrpnU=
X-Proofpoint-ORIG-GUID: 9EIMl9wAoriv51j9-EXGAgZrAOe9_62B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfXz0i7YgERvwUJ
 xVnLmAZR0BObAeoBXd4u+7VsLFBIqvL1BGhfBPygCdAt/4HL2VKBtAhOpIm5x5ajPT54226EEPU
 8oDnz/NicKutfLnu4GEXf1IMjAAX/1u5K06nxxrBBJwYnE4iD1h9Q3AoqZSb+An55OHCiuy/BnA
 fYnU079TtcJd6jvIe5/S37C41/CIrBXOv2jGmbQqJ6xeqmoiQw+06jYilw8Ul4harXTnXNTxOf3
 FdGrGTTkfqBwlvsIgW65iL9nqLylXhe3whREuGU9bhCAZBFWdtZvm4BZDCVDnn7dSu6xexAxk9P
 YewJGc68uBqsDgeFd4bfd2ANqdHLEmpZFa8CVMMyrXO7T7jpArskAdSKe/A1rXTZe1t1RvmNmqt
 VPq8L/+GoviLyOuDfm9U3Ae3ky/rzNuxwC/hLSc4hAQOFG5bRp36i6Md5ThX8s3NHGcGIvVbXoM
 o8RXpueOj6nZ4z+XaSQ==
X-Proofpoint-GUID: 9EIMl9wAoriv51j9-EXGAgZrAOe9_62B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010032

On 9/30/26 11:28 AM, Jianfeng Liu wrote:
> UEFI leaves disp_cc_pll0 locked and running for the handover
> framebuffer.  clk_disable_unused() runs before any
> display driver probes, finds it unused (no consumers, no
> CLK_IGNORE_UNUSED) and powers it down through
> alpha_pll_reset_lucid_evo_disable().  When the DPU driver later
> enables mdp_clk, alpha_pll_reset_lucid_evo_prepare() performs a
> full PLL reset and relock.

Can you give

https://lore.kernel.org/linux-arm-msm/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/

a shot?

Konrad
