Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCCB469851
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 13:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787665724; cv=none; b=YN7oAzjwjanQQnU1erE+G+Bc/0soPDgJFsDXiQvpaNOwF9UtM/PgH5vxdhO/w/9e2FIqQDt5P5xG7ubfqIRQrbP4cEU0/hgAF4XabVxUlAyDb3CnRMO2pYNDRAD8wghaNps6cg3iM3KVrPn6xuWfQY5dU3+4G2tByDp39uP1bLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787665724; c=relaxed/simple;
	bh=koWaIjYKue8o76GV/cyxINDET8Wt5+y/PlcMmLYYCMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nit2O32WQCRWfOM1VARrKbcQXWm/BM68rJcn3sVmT3O/w/JczRFQ1HYXuJG5zrniiql/4KGjrqW0ZlHa56o9NBJzOa1tU1yhqqyn9wksdfhF881k+Crrp+O0OtgT0Yc/Vp5sNXAzadc9mBtLG48LiUWYddvpHSN3hEjfr2FWaKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQmZgWzz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bz12fFuG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQmZgWzz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bz12fFuG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAvBAx2090816
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 13:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Mtw2dg1AiVlIAwCktRzCgLUkOpeqTfw7nexb4BnJuw=; b=PQmZgWzzCGUEexZC
	Wt9Rpm2flIlXflo+iBq85m+TgbcuFkSr54XfwaG5gq3BkrK+3q273F0UOoojEhBq
	1y0RFRqyMgrGvjh6KA5qf4aBb/P4cBoE1z3aWI5IscDcH7YuLTkXvebdHHKClS37
	q5XEOqLxb2tBB0di7Qwhdu/QXDBGVk86klSIboFbI8Ixf7rx5oHNPsc334AfmlPw
	jtl8vojrlGWm7v3OMgRaaG8FcE6fCsqekLPxLoXuFnHWl95lSqgkydwG3AypxhK2
	eq2HUgkQN64dsi8KAyTuPvqF75JGMMiTCRcU4OwaEAbw96xrE7plDX3hiEh7q/dw
	3LoSDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93kvt8fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 13:48:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9375d92d0caso34470185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787665721; x=1788270521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Mtw2dg1AiVlIAwCktRzCgLUkOpeqTfw7nexb4BnJuw=;
        b=bz12fFuGHeIF8xEJihZSlSuU5w4PU/+ycFS9SAtFAF83CDlEfI0tpAb032x4NQ0Emp
         Mf6EOzz3qDkdQGp0KxqDS50G1qQtaU9A90/hEeU1vkdP5hzE8XjJgPii6RKgegPUjeeH
         5mpU9XH5ydR0VYWKbB7y5Uev3Wf597mKwZjUnPfv6zO58ZCJZEYG5H9yygVOxR8Bouml
         oFzTtT/SZ46xPnOuar6QLx+JDembfXPnE7yu1iYab9rw6v296rTSeRxMCpZpEwfNG8It
         a3cVpUtKTN7hVPephP173sOh+I34r0Rirzy3vzRtzbNpzn55cmJJR5KbFG87PwCeka7/
         glWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787665721; x=1788270521;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Mtw2dg1AiVlIAwCktRzCgLUkOpeqTfw7nexb4BnJuw=;
        b=ZEwPoTEIDtyU+4s0roYDfdPAutx+5iisZmJCjYjIU4sRJvxWNJ1YukCKxR/IFoo83B
         LDbISL+ZG4klZGniv71tvlpxPuLbvjxq9QWZg2o8OOvJ6pq2Ne/gD+6BXCufwN7WkHgL
         4NOOafRWiYzIndUxlDIZA7ly5Ogy853AAEb6a14AP8WOJDjJ1/Y+3G6R2ML7aM8A1RZU
         CY+4nABtMRBphZzzYKt9QF9cmA3omq/uH372ncHUKroHrxWsclTmRCRx86fkvnQUkPOk
         BfgYfrV2NSwd026JeXj1NY3y326BJLY3mZ6O/wCeD02zSetr+9az+NDIL1VcsQuDjUiD
         uZpg==
X-Gm-Message-State: AFuF++mjKEi3aEqLEsmzvpWFvdr5SGl1JEfemewMIDYrYTYf5J4YoVH0
	svVYdNJXMFmnyFAilas8opguAIlpNI92MVe2/iPyaArAOh+o9TT1cTHuRELk/ijhj+M++k1VCmm
	wX8PccR/Jn5yi9sI78xtXM369OnDEQvRcdXExiey1l8UETne6Ue+V0QN7t8FUY0WdmSNi
X-Gm-Gg: AR+sD101u9XzLZ6kZPPbkkkOFqb9oWYsKJyASv6boUB/q/SCzAjDK5vhaz0MuLcCpZi
	c+Y/jVT7XyWu2ftUbTcElBKQrHm516afvSeuVTVmr1k+Pn4WrWcpNqYODzcBTpFW6RAf2OUTxYE
	WegbhT71Iw8Zfwt7KH8EsuZVe2u0PPyxIRiOVUL/tAN/QJAr/7k/R1epRE7Sk8X61fV4sG5yZWC
	CI/Ct1XzXHgYuQMjZXe8xExfHr6uGQFv2Mp0vHUl0ANbAtXDoV1/k6c8rJaktOO2MXBiBMbuLoF
	+7d09FLcBxyEZNbP7VVmbuVGjlaMOxdFiRO4UpZqLDt3imcHVapj4z0OHq5suSI97YvXfBCvDZE
	ngUetUVAcXMF/OMfxlrjsYCVj
X-Received: by 2002:a05:620a:268c:b0:936:f9a6:3813 with SMTP id af79cd13be357-937392bd42dmr2299901285a.0.1787665721071;
        Tue, 25 Aug 2026 06:48:41 -0700 (PDT)
X-Received: by 2002:a05:620a:268c:b0:936:f9a6:3813 with SMTP id af79cd13be357-937392bd42dmr2299896985a.0.1787665720597;
        Tue, 25 Aug 2026 06:48:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1c2fcb944sm20983451fa.29.2026.08.25.06.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:48:39 -0700 (PDT)
Message-ID: <eedc1702-7767-4d5c-8077-20432766c613@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 15:48:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: dts: qcom: qcs6490-rb3gen2: add audio CMA
 memory region for AudioReach
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260825133333.376591-1-karthik.s@oss.qualcomm.com>
 <20260825133333.376591-2-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825133333.376591-2-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDExNyBTYWx0ZWRfXzRAYEcSF/+TR
 9Wsyc/4CTTXWW45ENEnwFWApfUaDuyEr+3z6YvbLbq7NvJM3or0cdfSvzS7+qhO6BYE1Rx2Ymul
 IvWQZwnrHLKcY09pIITB0pvyaB5V3tBukRzWP6ExoqfJFLizKN8X0o2LVmI+T841hejRGYrBSlR
 x4oSeAZEDMWstseOTN/hhEfT6uueeXT1aZ0ep5gR4MFwoaLst0BELIORtZ2h+s7okYSD5b2czWi
 3yQP8DYtOYJ/0sbQyy+Se38DR+Lfk9qR6Z0CL4qyRneNSVF0MXWbiXTUaZ9W/kdSWCxm0QN2F6U
 +wqs0Gl+U3LEfE2IRdC8NT2kdjllBBaQHlWdMfpemIQ8bw13Gqf+Jq3cxmL0l+cd17WEAqU7V6D
 5D2JF0fm1B8vK2WntU5oBYcPHgIzSgCkPj+I134OCU1DLsSvPPrazNyH9wXSiZ5ind04ybNtVEl
 KCEejMGquSDbP9OUagw==
X-Authority-Analysis: v=2.4 cv=aPHAb79m c=1 sm=1 tr=0 ts=6a8d9d39 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=v8qUxcD9Pr_f-00p6x0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDExNyBTYWx0ZWRfX42acoJjU+DUg
 k8xBKjFnGDNceNuaUgGoecz+ptoqeFupFFqyiEMEsUvUXEs42MzfT6BLedHG2tTSK9sWQ3sNHHY
 vmLlFWI+I5/MLbLhr8Y0oAhe5RVw6+U=
X-Proofpoint-ORIG-GUID: s-fC4HHGWk_31VuFDzCefXw4oaNbW7_8
X-Proofpoint-GUID: s-fC4HHGWk_31VuFDzCefXw4oaNbW7_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250117

On 8/25/26 3:33 PM, Karthik S wrote:
> Add a dynamic CMA pool for the AudioReach audio stack on qcs6490-rb3gen2.
> Use alloc-ranges to let the kernel pick a free address rather than a fixed
> reg, which avoided EFI-reserved memory at 0x9cc00000. Add 4 MiB alignment
> to satisfy CMA_MIN_ALIGNMENT_BYTES. Wire memory-region into q6apmdai so
> the q6apm-audio-mem-cma child driver can attach the pool.
> 
> Based on the equivalent implementation for lemans (SA8295P).
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---

Please don't send patches that you haven't compile-tested

Konrad
