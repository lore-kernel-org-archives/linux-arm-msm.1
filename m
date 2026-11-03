Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698108;
	b=YQvab6FyVWJJkTZF+O4/kcUB9fiYTZaaexChRMhhD6iWlkjvPkLOXwpK/TxVZJmCeVxB
	 4nCBr0qUJW11f55rmi9WEq16V5D4N0cPmEjH6Ue/4GyU21V23VRgWwHgmuLS/2jPcOiHI
	 +vSfW6RaHTo13bujX5VXzm/ZisEPw3NWBEM2kiwVXz0zXR731QsxTK3IvGfMQhUIpQ7Uv
	 afaaDxc4tY9xVeEX3v5kAU8+4pV7feY21yB2BV7nNPaSeWL/H3PPF0OFkZq4zcn0vjyZ4
	 hTSTcCnLsAV4/NsMlujL0DlohJhRtSpgOZeY7xIkboRRKRkfMERvZcBFI35yHRGqGwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698108;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CnLwxnc87zGnVss348UPyqqWPDveLZQZgSaACTND7ko=;
	b=r5hxLt/PSIkuDkwIDw/gy7IwUrmwilaTPr8V04lWQl+JZCGxGLyWq0fp8/3PbcL3sn2v
	 kwy2Es2MUcrnmhThtvXB00pFjyvrx077eM8834GmGKaUjD0xOlChuJL8ir/+MWMJpI/7z
	 iQcnFYk4mEitAf4Lsq2e6vDOsiadUZeTwRLQgEfgCb3TVawURRc1Yp15Ucpu4AS1fwQHi
	 /K8/Lv7HGDLiuyxDc4ZyHhoXA0oF0k1Rt58TVp3NhHxi3d52b+cvbynFAWfH1eG+Z+D3S
	 FHHRw6GMwAsbi6rN4NIWptnk/+5WD39VYwcpi4m+eRA2PZkllBfQ8ETX8KT+55sLQqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Paa42qr0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XjrNM+fC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C5B606D83A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 09:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C5B606D83A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Paa42qr0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XjrNM+fC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A39Koff2715393
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 09:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CnLwxnc87zGnVss348UPyqqWPDveLZQZgSaACTND7ko=; b=Paa42qr0P3PMZZsA
	wtsXsKohzQTuOaxCDEXPIGYM6fW1SkLcgzIq7hKWBuS6MoMyNShKdUPLDrA3TEEp
	KoRIgJBT8DAfFUMnHjnisOfOi0Fvir/XxD5wIoZg5ypvD8CIuVFYpslhT0+dvFMs
	6/DdSspeX03xqt+MU4QcpXnQm9bX6QQXmiYbQxG6qefx2ydzcBydxHzRq68YJoXU
	HUK66gttema0l/K8eEbRQU1N1GByO2Hoo+nay9uF7evyK+OPm7VX3kRRcANMlO/Z
	XTkcQRAHiBFtGsj3E+zBBFT2vD+Pwf9gIG7bFlco2+AoC1wEgstTWv+3CP9Vnhrb
	UC6MWQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76d9dyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:28:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea6b66e53so72793685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 01:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793698106; x=1794302906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnLwxnc87zGnVss348UPyqqWPDveLZQZgSaACTND7ko=;
        b=XjrNM+fCJwSBOUO/eXz+K6Bpz4aLWsrL59h+6YAwsxHmLcjvaD+rkD02txPa+ZNaM0
         NU3P2McmS3SummUye7elrrNTiWgeF+C016lNsaL5B9VqjaVD5im9BYy5DRIyAn2misZ9
         /kwbwpy00idlGHtMwyOyHY0YBE+TrC3fSg669vDfi6vaVutjM/WTwPk5VzvP2SIXdSxI
         TYLKodqZDtVrDH2iwhHjF5AUzveheSM3LPiDzWqo9JewBBjvyMazWzI0dk0hXltCvfru
         1QtMaHXJNlgveHxWcF2FvHXPzMiOEw/gXJold8KenZEENz6+pB20elqD1KMQjzA6o62m
         tY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698106; x=1794302906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CnLwxnc87zGnVss348UPyqqWPDveLZQZgSaACTND7ko=;
        b=Pc54t7faCeZgcjjX8u1zx9frid1Ni3kJ5fwXeqlYsxH5frkR0poZIPWVLrvd7VkoIp
         5tnncT2xRx+5m9+04yoawixrp40GPXezjPYSBiiyCk3xg4lLsNjNFkowrxtqDMcJZbnJ
         Cy6aX816c9ta38TEgQWV+0WLCRTFnw9wdIaH8nalyrcyDYmMdIETdX9fOVhfZ8xPu3+B
         q8+jbT3ElCt+ZdIV7F816mvstKhe69TL2KEXBzvSAf4oDyr4TnGu2LKY1XAkUbqp+G/2
         vRYOM+kL2xoPkBxfHSfTV2NmzB1Obnt2o4hekkrSsSDClfOD0pKMmGpECu9If5SaUgxr
         XT4Q==
X-Gm-Message-State: APuU4Z9SzNxY74D03RMDPQc4XI8zrKdc9d+WIUTqWFq0ktaKB8ChcGmV
	L9OtBupxMtHW1fEr5DxaqVUSPutQIPLL3TQRnXU827QBG0yaaWSVkvyXD6g1jSXr4SN9xmZgSlD
	R/8kOWYIkonteMb902tzggSCjvZr3+xYJ7ANAQeel5ecUfb18majAbYAsDPRTAkIe+4cW
X-Gm-Gg: AYBFou3nRz2src4au8OzsJ7NB3QuvTFe1X3t/LBIIWxxJLqFarMZfWTRLx7xmA77F/y
	8kbHhZ4sHsykC3Gu9xxmvGlEtQJ7EGtDsY6r1FOK3VnTNdz1tXeUpplKeqDrhNMe4xE92VxVn1S
	g8VQ/Vxt+bY9AuMRzz+/7XB3WOonU+OnhqXGOKhQ+oC52GaVNFvzNG4etcNyTqHM2Q2mrzA+vXD
	z2naHfZbhbRScsOT3+e+S+Cr0Gd8bj8RyijQ3uj1fePZD+YkS7GcpM2n5QjPOetPm4I4tXcVX7y
	AfQuIzeAjZJC46H47c6XzqbpVY32qbyO9n9dVmrl0NxQEOZbkbwuGiY+RGM0WNs1Y7+ZmVsMPZV
	cEtUEVUduD3Svu+JU1x4gvtNmOtxpoq+DayOei31aQjs1msKjmoy0e3WVJyuQa2Q+xEH7qQ==
X-Received: by 2002:a05:620a:4d0e:b0:939:8148:1e3d with SMTP id af79cd13be357-944215b76dbmr2356106585a.2.1793698106230;
        Tue, 03 Nov 2026 01:28:26 -0800 (PST)
X-Received: by 2002:a05:620a:4d0e:b0:939:8148:1e3d with SMTP id af79cd13be357-944215b76dbmr2356104885a.2.1793698105836;
        Tue, 03 Nov 2026 01:28:25 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0fbd6sm4065994a12.24.2026.11.03.01.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:28:24 -0800 (PST)
Message-ID: <9f6029c0-5dcb-4835-998f-03b1b30edaa6@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:28:21 +0100
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
Subject: Re: [PATCH] spmi: pmic-arb: Fix the driver data used by non-data
 commands
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dan Carpenter <error27@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261102-spmi-pmic-arb-cmd-drvdata-v1-1-2e5ec8035b85@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-spmi-pmic-arb-cmd-drvdata-v1-1-2e5ec8035b85@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae9a93b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yHj-swwPdn-rtVx7EIEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNyBTYWx0ZWRfX68HdOcPsZyVO
 Cv/KKqF0bpzyfWSxWxyCEN2wWjASlkIsk4Hq0FSwU6XEQC2/qLKXgVmbxfD6sQtrNfdBqtNBZ2b
 tmpq406WfqEQiLaQNAfueNQ6DIrLB8w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNyBTYWx0ZWRfX2HrBBMp1qG0u
 qtRmm06pYp05c1hZMFAg3UvpPnc/L8snY3psASktc7bNZnQThW/rNbUN/11MUztUZA8RrW94c+i
 4Pfk4qO7scKosEouiN8ntLgg7x887nmj54QJfk2ljHjD0VH0ZcIvB3dqOwHFyFVuzE2OU7Tg7xL
 03l2wHMjz4aXJxD/TR65YVbUzeo6gN8rfdiH9hG16OsL+Gv5ZnJBo14TsOeSY1QEV3YWTscs8oz
 /+f9foFRjS+YEQmdGkyRIGQZ/agvUpzPbH0RPOMoxNhhZoLityLFPsljRkbtxv5hNyWALPimD1y
 31DkflrJsxMXfsKePzv8ZU/Fj3L4qzzzIvAf8hse7e1yPwfSmn6iy9rb+zJ3rM6ualoarHvdYns
 G7jvlaXxTem3bul3XHSCM06Dy7UduyUFx90C2Wng2sPx9wpg6ipXUIGwjTamHwPu8xmv7+6FTQ8
 CEA3K4lDdq86UofGyKg==
X-Proofpoint-GUID: 6hIeZ6_s5lkgW7pFOkW0KRRF_Kgq5ZwH
X-Proofpoint-ORIG-GUID: 6hIeZ6_s5lkgW7pFOkW0KRRF_Kgq5ZwH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030037

On 11/2/26 4:46 PM, Abel Vesa wrote:
> Since commit 02922ccbb330 ("spmi: pmic-arb: Register controller for bus
> instead of arbiter"), the driver data of each SPMI controller is a
> struct spmi_pmic_arb_bus, which points to the arbiter. pmic_arb_cmd()
> was not converted along with the other controller callbacks and still
> takes the driver data for the arbiter itself, so a non-data command
> reads ver_ops from the wrong structure and calls through a bogus
> pointer.
> 
> No in-tree driver sends non-data commands at the moment, which is why
> this has gone unnoticed, but spmi_command_reset() and friends are
> exported for any SPMI client to use.
> 
> Get the arbiter through the bus, like the other callbacks do.
> 
> Fixes: 02922ccbb330 ("spmi: pmic-arb: Register controller for bus instead of arbiter")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-29e1d31a-8d20-42c9-a5b3-41a90553d799
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
