Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C30A37F728
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787054861; cv=none; b=C08O/zHoh0VDKGS0mJsnV/rfk/baSbe/PCy41v/fAAU3n29yCfOpXo6easO6VG9+Zm8rZ8FgNuTsviGyQ/bOSB65nCYR7ny7MGcL+S/duVUyOsJVFmR2wAtzOFJbn5c44zHlFyJlxdKQfZlFnJ+v+UWKWvva3fRHJaTM2T2ATd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787054861; c=relaxed/simple;
	bh=3r7knVhGZGq+WCrj+RsM6COqa6AyLlTag3U5LHNzNz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cmbJ14S3Nb3fleOatOYuYRXKbEbSCVpzCKCmBNJdMtcmz9rxxi6YvD+P/hJTszxPlvLL38I1WkKwK5G27x/7f6KxYfBla7ABr0MTqMDr7W3LsjxPR3xtROo6I77hk9d0/9WPn6+ux4SFJfZge5MpFradH6Y5GKcvlvetAjJ5Jeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bLhnj3He; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CSnkS/dW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bLhnj3He";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CSnkS/dW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABfMQ820115
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kyfh3wdgd9lUoXbO0HmIc2QmpIubp30Zz5X3LdzooKM=; b=bLhnj3HeabgyONhg
	CfDFm/DWs64JGtmP2y9pmUBaNj3ocmMiHzKn+57jTANan3EXr4u3NvlbdUgQadxP
	mANHL4EOgaY0hn2wLFrE3oQGkoSh03nkHEI3MH/qSNQ7xcl1Huwscvf3gcwrjdd/
	1o9AQqZI+WoqQDPnE9vnE8tC/HVqWM8P6id3PBXasJFlIOHfoPGIjewqCTU/uYEY
	Rtx1Ah7JcabgO/Ye0jTmw+diu6JfAbU4NEuDhGxmtNXQOB9/XhrIMqcvnDvb4ebG
	tLqu01K00t05GjyEDlyw0hQ7egXqgsNuNIoxGF5NNG5A6eK0Cdj1LvKfc4FdglXL
	JWD0wA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p1wkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:07:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93495488976so120005385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787054859; x=1787659659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kyfh3wdgd9lUoXbO0HmIc2QmpIubp30Zz5X3LdzooKM=;
        b=CSnkS/dWYkDSXATLMjvH6OEHq+FJbKuUmy6xADqdjKpfc+MlP9zi95xaEz2i5dmNu5
         x4lhKYqNeGjk4nom6l3tgKejORILIh941NLtUeKmbrM4dubOd4a7RQlyrSZJEkLVoeH0
         E0SyXzjlFIeY9Qir/G8WIQFjWR92sz55lAYka35kl8+IWv6+j5/IssagmvTb/sTdyVhO
         81zSzFzoT5oQA01OJlUtVyfTTQi1zVhPttAAj6b2nDhtBxCyrFyTwZcMNQcvlvPTy6qa
         sJv6OlIbd+SaGRS0mNy31795AxVB0KPukk2b7Ajlhk+L7WsZxNcqGAB0RhHddJSdCVG8
         wdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787054859; x=1787659659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kyfh3wdgd9lUoXbO0HmIc2QmpIubp30Zz5X3LdzooKM=;
        b=ByrdyoxknqGsc1QJnxQSXgAxqzLSne2h0UlBCcDiV56G8+H4nlJgx3eNmk8QlOvPW1
         dOqpSaksStSCD1/ySQrLnw8jyVRA4GRxHA2Lnu6EcJWbFDUy8VVnKddUHrUZNj7IOFg7
         kRSSJVTSaAXjSWgWggn9uoHndj8TruAP7kdFzeJd3yNgYaimmco8CCoCqII5LGqwN0Ak
         2dkILgFjyGU66qbOx70PKBxBYdhPmLIGXyh3eD1GbJLbJcqzrfQ48IXsEWrmnYhReOVh
         GAtPU+Za009MkCXC+1++28Fnj/oRB0GzWVJSSHhXw+gZZGkq8Pq22HF9jFfk/CouHDxz
         dx6w==
X-Forwarded-Encrypted: i=1; AHgh+RofPI6r1bj81sSAxGFInYkNAIidD1kdoyw2gT6/G+26IPUuHtxGLL/6c6AOux7HDtV/m/zEzsuewxNFTtBR@vger.kernel.org
X-Gm-Message-State: AOJu0YxLtpevLvQwFquV+QqSepFd5UOwhPLoYHGxzFCBWs4Si+3QW0tP
	GGJdzWhfZFftYOPS5fGLhtNO5v+10PcQDPU9KegudGgtE9VKFmxPHttrWL5t4v6sxSvaW79G9q0
	QXEmn42V+KyFApplBcWP01Ey/ySj/T5bVK9DW+ZUYRoktg6yeyO8UIF9zJIATo63DPkPk
X-Gm-Gg: AR+sD11LzehzEiU1ccpzpWzzHCBfrGVeqJIA0YPL8jqNFAvgz3eSgwtHba7ICsQ49N8
	RwxDe4TfsFdPz2MJ/tJtkLACsC5Ng94ft1xZnIzsqYOd7zvE7YKyXzvTVrh76WHOdTAyQw693NP
	gtTHg93vfs+UKLVxUk0G3quaejUDDBtURXZVQyIDL1GbWSTt3GhTQADL7QtTy+8jLuL0szTQ63d
	+Ua350t1sYmmt6gv8l+e35VO8DnMreFPx/LdFdQb1Px16eDiGC3ngkbz013Ya6D5EgBDQe4XMZY
	nNqTK5DdRi8OLj15LgFJwN69gu+a6ahtNp3IpRkV9hzEfuZPmtBDevsWvtwtYpd+pgtz/TnDVoe
	xEhjGi5ojpSt0bf2Ly2QWODpR
X-Received: by 2002:a05:620a:6846:b0:92e:5272:4e3e with SMTP id af79cd13be357-936d1f0a69cmr2304633285a.0.1787054858438;
        Tue, 18 Aug 2026 05:07:38 -0700 (PDT)
X-Received: by 2002:a05:620a:6846:b0:92e:5272:4e3e with SMTP id af79cd13be357-936d1f0a69cmr2304624885a.0.1787054857750;
        Tue, 18 Aug 2026 05:07:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8524445sm1699810a12.7.2026.08.18.05.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:07:36 -0700 (PDT)
Message-ID: <8eb4ee0d-a505-4b2f-b0ce-ac4f21384ff5@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:07:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] i2c: qcom-cci: Share the timing table across CCI
 revisions
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org
References: <20260801-cci-clk-fix-v4-0-e1d80da54e01@oss.qualcomm.com>
 <20260801-cci-clk-fix-v4-4-e1d80da54e01@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260801-cci-clk-fix-v4-4-e1d80da54e01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UiH1KCI1icw1qDZb1nSQPCkiEKj9fpjp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4OSBTYWx0ZWRfX6JLm4Ed1VZxC
 y9SwRTXzdhompp8vY9+0SKBozL8ZluHs0HpaRCLHAZWVcVbuqYAEPqyDVJjyrWbYdOH+zJelUkg
 K0iO6kcM6bPI2+DyDmSEYeNN7U5cr4g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4OSBTYWx0ZWRfXzJueMEzwQ84T
 Jo1lkPbCG2uUDIqVuT0Ott2V6ZLQrJG0Y7iXpocfHLpiw48XPjwrd/E5E9A9HD3xw7gAJg3Lgua
 s4Ma+lAcQ1te+jBE44FnCBbVY7WK+YXZYLAPV6B8haz2dMQGPmRMnYmUFKlzsbC0a6DAO7ZW5b2
 2lMhxb9HAmE6PhdObNig3G5HnK7heJK+5sllmG99tk+bajGK1iANl7p4SG+XAnWT2SXU5fTSyLg
 LFCqxL0b3JIJo45km69FK6l0LBhZCp6tASWRmSgmyDTvK/b/Rv1ejpyWXZ/P6vu46mBIIatI1rI
 MoPJs4jcvvxly++XGygeOQJEcMqKul62VtP4PpKqT5yODALJTBYSjZlbBAvypVW3arA/XZKSdFE
 fbhBQ+rzYkKxiVhEZkPbXtRy2TR2Np/7ybY0b0uCW/liPEehZVin59PWqupZr17BfvME3fWjK9l
 FA1IDw9zUPopykqmbAQ==
X-Proofpoint-ORIG-GUID: UiH1KCI1icw1qDZb1nSQPCkiEKj9fpjp
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a844b0b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=SwLGY96dXX6l99FlqfMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180089

On 8/1/26 10:10 PM, Loic Poulain wrote:
> The hw_params timing values only depend on the CCI clock rate and the
> I2C mode, not on the hardware revision: every per-variant table used
> identical values for a given [rate][mode]. Only the set of supported
> modes differs between revisions.
> 
> Move the timings into a single shared cci_hw_params[rate][mode] table
> and describe each variant's highest supported mode in cci_data with
> max_mode instead of duplicating the timing values. This removes the
> per-variant timing tables without any functional change.
> 
> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
