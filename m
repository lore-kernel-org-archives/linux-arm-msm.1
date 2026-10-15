Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA0E50EC02
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059660; cv=none; b=CoVEJVG0mEJ5kzC1Dv9/h+N7MQdUbhYBrTcFtO/Cwv+7aH64f63Z3MlVnu6pHjbVkHecYS9kY7haoc2WNIJJ2P+BcFUkYUiQ6ptTEkXfDIGeWu0z9s0U4tCQuQDqxzzYaADKnUI7/yeBIauHEeUpGpn7y5J+krIbCO7BadVJc2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059660; c=relaxed/simple;
	bh=AfazupRWWtICoUAGH1bBSGvypUPJoxkkS6rNv9KiWsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IvCoMHCDgzOiZHUm3Et9j3FnXewSHDFWNMkVWOOWqy+ddcwjDJ1EqFYluUqc0DGiFSAtzLZtq4QT3U28N4LNYYOQL5w2FZLkR73FAqyqu8yWIjFb3f4vnFEMH1ifXTnI6XoqCzUinkzEo2NFwPY3fPSUSUH5KfmP2XCa9g0HYJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oBIfJRno; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PRO1Rpsu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oBIfJRno";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PRO1Rpsu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jqSN3408923
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vGqPYmz+xUpL9VkJ6AfNSwDSzuKUGDs49ODBW/+uu5A=; b=oBIfJRno+sYg/ngg
	B8usJs5xu7nde6QQPE+thF8mZWDZEY2amZdl06EpXXXfedfLPFu1SimGzLbU19q/
	Epel+YfyPso27KT1Pu1BXlFWuvpLI3fbiLNOX8rLYd388DOG3aejxkJdtb68xtEr
	ZHxz/vbZl0No0lv1h5wX72IFjp1Fhr16mDE+sYSb9OvLdIPkUY+2pQhxdfKWGFKa
	/OpBuGu5FwkDGb8pcARX0IU19m4mAm/z7TE8j5RdbCZgPaPE/C8CpisaHu51wcI8
	9nLYA3bHVjlIcSm1iY6/PYUz3+T23DV+a5I3XUgurR62v/oLwR5oix7sFavB/Yuy
	SlLWmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn28hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:20:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc19d8e59so61396685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059658; x=1792664458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGqPYmz+xUpL9VkJ6AfNSwDSzuKUGDs49ODBW/+uu5A=;
        b=PRO1Rpsu/7GJxiSdQZ+ZuU3C7xC39jYdGmY113iG60Hs7s/VJ0cUr06VXZ8HDOZGN2
         gyfR0PL2EaMgSnKZvEOZTgFEgCEnKyrg4KbrUnBtS4qC/rts3dBBWBz0CDTDF3qvwv0C
         DMrbRqC9hQx/mKQKUfCrdmkaFEf4Xn2zb85i16kf38D84Y2CFYLZrClicFQegeHkUmt4
         M+EYIGOP1+vLA37UPGPduSMKeAlgFO2gQYWD4NzNUcANsPXPCOCLFhjRmW8ybvQM9seL
         Tjgz1owknrHku7IJmL1dFtKwq2TTmSu84X7LFbpeMUoY8SR5OwDdkMIAputWvzMUJXCv
         u0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059658; x=1792664458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGqPYmz+xUpL9VkJ6AfNSwDSzuKUGDs49ODBW/+uu5A=;
        b=L2/2g1CdD6VfhEJY2Qw4j8PDTAUy308PF9rnXD1FVY6Tvx8GFigQbet78B3D8+LwQe
         a8+T3sWbXbFz18hOJCXyyIietH1U71aU/3UDZaOF4nNntzoFkOL9XEK0/WVHxH6cqKYZ
         G+EJfGTSoCaf6NpwEwKoW33lOOBgJbYeQAXe8u1gr6JNHbHiXv9ghJhqU14ruL98a+k6
         08YzIQE2v2GyFRmvcNCFJa4uoilD/8eZ7w8fnWtbZd2T9oktRsaoY69LFrpVbdRGYomC
         yKMlNFpasSYQeExWU4SVv7bqBP97pWQV381UvlHDdp4pH3nkW7r4+UqAC/61r6JtatWx
         N0hQ==
X-Forwarded-Encrypted: i=1; AKwUvBzM6THYy+r2wC0awzkE7FW3A7idIQMyk3bi09ZmEfCFOZ0qugVCg5vlQ40c8Gnd/zUji5/bkJolxZr5H57N@vger.kernel.org
X-Gm-Message-State: AFq9FYK7pzpggtgyJuvpIhkAq2gZ9eJm58k/qMuMVC3KkMh+H6+NmF/5
	B7zhNwKHPP4QW8QIcGHcLhhk2SZN4Ts1DpJ/75uCsnyVCnF5t2MiADaIz5xvtIjiNXDxwhrgwD1
	lugpYgOGeAJZ5MjTodbNQ3WzSzmfUz9X4GM/6Vd8rBe7tlnOYMoVrG07oFbHrxItUlLV6Aw99kt
	wE
X-Gm-Gg: AYBFou0CQaNc4+xp140FJmWvNVBNzJcUyLag4PtkXLbze98S8qObw3ioMfA1dFd9IMi
	VZOfO5DyWMX0v0t6fVsQJaHVZEo/4Y5pSFGTgUFOFtz9imLK2ItfsWyAc+3lWEg6aQ7IcZhuEyg
	kfJhVMHiT8UpaQbfen9srPkhEu+yOyrkqZN8LMoK0V/92W02L7iYvsdoks3RSM1jElbDQpvi6bM
	0Y0e+fQPNk5sB57qvl6/esz8fuwjoiSuiW/TiteQ9ZCXl2T+5I0K5/1cxYmAekElYVNRYOv1b6D
	doIiFVO0Wmsb1Behf+WKnuLg2Idn+OfFFfBK1wNew1p+6dQOql0bs1jqGq83e5AbWjyZVB+8DCM
	AV+M/n9yzO8V54Rqq9qnM/Q==
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr3599360385a.6.1792059657863;
        Thu, 15 Oct 2026 03:20:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr3599356685a.6.1792059657298;
        Thu, 15 Oct 2026 03:20:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda622246sm105704266b.70.2026.10.15.03.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:20:54 -0700 (PDT)
Message-ID: <d8c2a208-1ce0-48b9-b850-2561bd37d3f1@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:20:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: glymur: Add videocc sleep clock
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008081036.3492003-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfXztZWmd77BnI8
 vIETl39mer4iUQWO4wnPgcp8iEFVMENjJL6ALQHUA4bJDheYhHig/jl5pKnw8DduT5MdfkE4SBs
 dHd+Jweh75nqtrm3zXmiLdWM8A389tTeCfUvJQ+F+Out49ewN64H/Hq5rRO+faFLbbrIeL2P8jJ
 CH9OSz6wif4+DzfEvKbc9rjFVo/tgpl8cW5PzF6aB0wBgnC18la/kvZngBB/tGtAGbs9Z5dfCBF
 2/H5dXcX+mE1CaavgMiUcAtEGQ2CCVBXu2cuIMWStbVWz3IIKF7DJYN6sxe5FHldrW3uVmao6Qf
 451CKr6s1B66c2/YYQG9Ua0qh/cljMY70zmqYU4Kg3Zorhc0B5IieivSif/x9uEq9cv7z0Povgr
 tHRJdZlvM3koaWJs+p2f5OvdOfFO/p1NWk4osxMMs/6RRstLD2r8tP1zZ8yrmzxLpinn7Q0f8U5
 m+TwN25kRt5rp05RMqQ==
X-Proofpoint-GUID: PL-wImUyWEcFZ4_jfe2OfkI32dRSINsS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX80fufWjrdo+p
 Z6lHxo1MuYEH2Y7bR2PHJhhfBdMaDejx3q9PfcptvNooo0vn9J2/Xz0FJtyFktbelSCBdb59jbP
 M262pJRpDJPajaDRHcE75FdBYk5zs1c=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0a90a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: PL-wImUyWEcFZ4_jfe2OfkI32dRSINsS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150041

On 10/8/26 10:10 AM, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> Glymur: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node passes only the first two.
> 
> Pass the board sleep clock as the third input. No functional change,
> the video sleep clock keeps the rate left by the bootloader and has no
> rate consumer.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
