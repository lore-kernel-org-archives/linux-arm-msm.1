Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477823;
	b=lCqj4o4pCuq7bfLpUZVz9axiyO12QBE1bTRS56B0cboPx2m52HozqnKGJJStG5Ks5zDr
	 cL9Apu/15DrkUGg3r4DIWMtLzC9V6bG1YpGxazRyzf3LrZs5g3uwAZ5ESjXuuM/jVQkCG
	 MFfavawSRydnf8V8v0PuVhq1a5eyBVX/dc0mgyf1npon7+IK//YZwd0B1CMrY74itcMub
	 SzVEiZSUg251BQ/5s5rkWkZ412t3W1WVhYK5bR2d+EFED7hgvJOTwoUjD3D+TAT6aytFO
	 UYi5eNecKLbPQ968DZHT44053ZdYbv49/I21/Vgjbxzxffmp8kI072GmG8Amn7naJ5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pKPCIIT6M/fMZi6tJxyHxHDP0VxtrN0zYyqL+KEmnBc=;
	b=gXaJ/KDtqN3525bBsCZVaUFX31nSQwlkuzcWXaY8gnMZJPixQnmsdO7s0cJ/b0TvdBI0
	 lHOYBFwFrXd47Y6JqN7+3GR9i2WrKpv1j+gP55l8T2vAhg/+IzSWzqMWbdhKTJSCiKJLT
	 yEtzI/qVjv+ZFULmWi29WxMBWCReZ96yRLpquUkc+0mbGzRnWZphN2Jos7IZRG+m7tIhJ
	 h6gJmzWNoJ2v824blgzycdfmrqElFrEHcL/EXbGIUnMRuK1RPXzjY/cDPfMWKw/9gX/XE
	 4S3go+xDSC2ABs6kyg98xh+YrdL2RA+43VWe2eqb7/Hy1Vm4fsgwVYs7tuKXeYw5EjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BmmpDTzX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OrpnJa/1";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5657A606A31F
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5657A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BmmpDTzX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OrpnJa/1
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tIT52877952
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pKPCIIT6M/fMZi6tJxyHxHDP0VxtrN0zYyqL+KEmnBc=; b=BmmpDTzXNc+YX4st
	bfe/NK2/6gFZ4vdG1tyysppxiH7aai6xMjWcsJrYj7qGW3tmsHtp4wC7y2cg7EfT
	i90zz/I9Oj1mq5SA3QsTBGdRMutye2yOnUXVBNWpqr/X7QujmY1+hygCKkVS6nPs
	1aqRNYQwXNVM5Psv2l/yDvpqBw52Ucr74WakHHhfxfLfMiCMTfzRYFd7Qs8SANQy
	8pC5f+COiz5ScmO/Lo3xQqo8NPIKLfX3F0v8Xf2nLNOSTKrQy6MdwhdVurjWafTo
	JM3UTDMxJED4vimMW1OOJm4nL9LUiKbvau3ddjQJfuWmWLhKj9HyjsULIalrPcv3
	F/htkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ps5v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:30:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so95911585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 23:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477820; x=1793082620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKPCIIT6M/fMZi6tJxyHxHDP0VxtrN0zYyqL+KEmnBc=;
        b=OrpnJa/1RfQTQWtVKVd+9K+TeDF77K3v5UngTSzUdHZLCn45jbYaFRDRxQZq9y9yQG
         zubdwksfx+KwJmrg/EbXJnv9W/OZ5dLTfZomfyc+ldWt/W0BATsFFACgYQKNcUex1+EM
         rgyysjmXU/+pF1ZxQdE9J0DaSgFsO2uA+Tg/43Wp3VVbU+MYTth2doQyhd0EpBmMIWok
         xw1VVAqPAoOdt5Pmw2SxC8tVWTptE5BMVLGE3+ThjrmRV1hU58FukMQfq2tB9J37uk2g
         q/W0ivLz1XWPC3mSZbUctf242nQLaTpdogHf6CXxnLIhREMiBOL9MRXIQqg+m1nRQgXn
         aRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477820; x=1793082620;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKPCIIT6M/fMZi6tJxyHxHDP0VxtrN0zYyqL+KEmnBc=;
        b=sMXTdzWRFv4ttgUmO1rejXN53HBwaaG0J0Vn/6z/bc66KcmYpCvNJVWBAZvKUkCyAV
         WZfD/EpNHcL7MB3aRizuLLfXa8GWrLi0K+th6wsoRuJM+9cQYwDFOtayxth0jTtmnEQs
         NL3wIIX8U+4afWfZzsVEbVoSoOoNiRdNfGSULN24c80tobgxBZfQst0b+kHykcCfeLet
         mMEfSIcK7vXE0qiUOul+JyFBq7lBjP3R/RiUF2q04+Ln87UaZBvYsZLGwHIuYF6mzvPM
         yWfpTrqEd6xukTFgknN73l+IkKg9r1uHTFtg1neXjT/4qfdH/FpLlGze/ho2MMc4DMe2
         dF9Q==
X-Gm-Message-State: AFq9FYIgwMWvFL47EyXfT5eIU+E6mR7Spa3DUJJDW+vnmtWWJZMVi/yM
	hpjpGK0d0ByytgiRiEAF4jhgyB8FX1fUuZ3Ocy1rJZu7qlrvSU1x2jMXM2RInm42s2qZ5w2PP1i
	Nk1tu9d/bfXXwRO1Hc82YzXnupvtGh6tUkTxyk2TodoNvVGx1t4lpQQLUqYYANh/phYgm
X-Gm-Gg: AYBFou3IzlhNRscb+UOgVqF1ykYGVhrlkr1dcwNKFX55WMlpeqCVPVhOTfgrPkY4xQq
	7O1Z/WYXStf5X2rDDbW7b3fPLsnJbJ7xRakSr2R+6mzcqsTi9vAhxMgJIJwBGSeM2ri549DzH6C
	+W6bdFPafanQ6Cq5t4DFPvNfNa+pK+TbUlnnuIVdDRNqlZW6Q1KfF9X/EHzSPqQVU3gUndoZi7c
	kIR4INwpo1RDJxG7m+271i+fuCAesTwxk3bEiOBt1jeXkGQBb1icGq7ykGZSIlYjEHy7KXlWkCF
	3IlFkFOSROZFEOaZGdAws425KKV+RmeTL/8OAzT2EsFrpKAi3V2AnlY0IgRTcTreAzEbKmXupi1
	UVWPk2Cxni/43tTTQ+FyEWA==
X-Received: by 2002:a05:620a:2948:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f29dcb869mr1908558685a.6.1792477820452;
        Mon, 19 Oct 2026 23:30:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f29dcb869mr1908553885a.6.1792477819882;
        Mon, 19 Oct 2026 23:30:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf72asm458746566b.18.2026.10.19.23.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:30:18 -0700 (PDT)
Message-ID: <ffdcdf4f-2c96-4c8c-97e2-808f94b59aa4@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:30:15 +0200
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
Subject: Re: [PATCH 01/10] clk: qcom: gcc-msm8998: leave the GPU BIMC source
 and SNOC DVM clocks on
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-1-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-1-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad70a7d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uh-2cw-LvnS1HXWvbVoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX1NyOwUFmt9gc
 aZcJ/3TDz14TXUXjhEpyb6SJ8oe8sx5qaTjV2yDS/t4seNty0uj8ZLgW76RH9yAPqeSsZZZZe4C
 NQnjUcrXLfYb/Q1JKqGy1pb4wZv11npXSmYuV/dxQt60V6xoqQo/ZdRpGvnyX40K/2g7Ivg7rqB
 bwziLPH5DgFxxBI7RAzV19DaY5VbiP8Rui7n5yH7B/DiOa3u0N94JgKf25D2+YSREhN8VXhn44O
 jFH0oEo0Gqzrje7HJVqf5LADalyXYmu2OSc4xpr58bLQqdRDWwjg+RlIAJw+n7CMRA1P1sgyDax
 +njsvxIvwABkGhWNN9nkIyrXCYuMjbqhYotG55MxEQjsdPsHcjYxpylzbhvGBg7zJTbiLvL1ZVX
 EQy4EmDtyeFXyUoeW6aPnLqId/CwAgLp4z7MOpzbPseaD+cSVTnsjuEfzIa+xyxq1uJgc4/+xGr
 +dkLVk7k3ehjYH1o1QA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX3zoJUQdicEyK
 VEC/OkOOFnmy5FEwb/tYUJBhK7yRUQUqztgSIGQvBvhLmQuQeAjMTONClIYZnpPz3BpgqQQChld
 EF2zqeK6HJGisKBx0zYSSxgHvntg9eA=
X-Proofpoint-GUID: RF_2qS_KZIzt4vwzXGn80jQvIMSERX-1
X-Proofpoint-ORIG-GUID: RF_2qS_KZIzt4vwzXGn80jQvIMSERX-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200025

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> Booting MSM8998 without clk_ignore_unused resets the SoC shortly after
> the unused clocks are turned off. Nothing references
> gcc_gpu_bimc_gfx_src_clk, so it gets gated, and the SoC goes down
> within a fraction of a second, with the GPU idle and with or without
> Venus. Listing it as a GPU SMMU clock does not help: the SoC then
> resets after the SMMU first runtime-suspends.
> 
> Downstream registered this clock and gcc_gpu_snoc_dvm_gfx_clk at
> first, then dropped both because they need to be left at their default
> ON state ("clk: msm: clock: Remove controlling some graphics clocks in
> Linux"). SDM660 got the same treatment, and the upstream SDM660 driver
> never registered them.
> 
> Do the same: stop registering both clocks and enable them at probe.

FWIW downstream just leaves them at reset state so it's not exactly
the same but writing shouldn't hurt either

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
