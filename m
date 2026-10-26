Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020737;
	b=svm2Lxhf2rriUTYJ+NB5TKTqINLueaTH7C9wN5loTO/DOhGtlETDEU873q6dzOay/2zq
	 6bcMzsmINXyGNsjqF7hlAZMGvbEkEHnmS/1XWXTRem9Kdc5uLyicL7BP8XxA0Bkw3KFOv
	 u3MfCxlQIwz7jTY6deO9RTcl2176Prm5ucx6i12fsz5Czp6G9IUzxxp2DJGo8ilCOyGq2
	 VNJKBqlxCWuA7Zg9O41EXkLc6U0GVscGiikEYyH2Ivs8QXZpqydrsJsRRMhlxo0wNrwbw
	 TDiZuFHNjdMS7I0a2xFSS/JtjX5QpFrIShs1LgZWcuone5mTGweSGbfFGMNdsQW4NUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lMyf20BlZ1h0WZ9ePXYbEch50SKh1zOCdibpTfZjCDE=;
	b=ORbs00uf/AeJjPe0ZxETLTo/8/e9hDgh8OQf5B4xk5tc2yy9OXdfeKyTtYJcOqqNJRJS
	 pozUhF+5vJYkF1XyQ7Dnhl7Tcp0K8GW8cPCAKr0VuugYQxUe2KNIG0HnOHyRdgdKdywKm
	 a8FzyEzkMtnTtplKL4SUd1Pgeg9cPxNGcGwMQZ5fX7SJTU9dEscDUsPr7+B3JlIslULWd
	 FtZYPSS6HvxJPIgKAYRtviXtNjFMBcQzdg4b0FtUn/uJG50FJwrJqVYAWMYUeYhtH3hZY
	 9Jy3JSXNQcRskhoryALHNysqppZmg3LNk/5JZlNaAs92ykEpNHozSJn8L04I1WTb+fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NGFEk8AC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ajt8vyrW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C376A606A330
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C376A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NGFEk8AC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ajt8vyrW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtKaD2734645
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lMyf20BlZ1h0WZ9ePXYbEch50SKh1zOCdibpTfZjCDE=; b=NGFEk8ACpJBSGqlN
	l6Rk7apbp/vgUNssfJ0pPDQN1vPFwmiO+HNLvgIbC4ymQrEnhQLmHGTc8fh/lLZK
	J4QgEVzB1cSkR1kPep3qiBeHAhx0Nc0SJJ99GDynyEl9JCJ1cEwHSrLh4g6MaE1X
	9KMCRLDACZBmK4GVohrpX0Ud3OFIQzV8/2vEwstZ7qinPZ3WzSk4GEN2xbEXB/xs
	Qi16szDSyqB3V6rKPiFt7GWbcHGt7MJ3blA7OwQ8zm+PsKYS/wa9q02Wt2aT0V+6
	q6ukTSUQy73h8BIEuk964CYqjJe11YcEYBI4FKF36PmfcnSC3nMjr2MUwQ/q0Vv1
	HN6G7A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8u14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:18:55 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988b7a28291so46426241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020735; x=1793625535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lMyf20BlZ1h0WZ9ePXYbEch50SKh1zOCdibpTfZjCDE=;
        b=Ajt8vyrWCeNj/FHHFBZJ+bOvhLy0eg7Fa3Uy3Lb5bntMSIDcLjzGiJE1JcpJzejkat
         4qJfEmy4KCK/dC0kZG8zEdORzC+wzTNWKVNAsbeT/kNr2xuOEKaNjRYECtR5MwdzMq/P
         /e+p8+P6yGODPFdwVm6N/NSgv7egb7e9aWtql69th+G47Bc8DBkqEXQqozytAQDXA4ir
         G6Oh6CeBkw4RDtJmK1SB6JV7HO74P+VhB5PrucHvvMVD5CoW86Ru+NSgQiW7gZPLpfin
         cu56JO37EgaOSle+DRywBgnXE5wdw2H0IID4suu9NjLBS2Qcb+J6qm3O1hKp5LC35hC9
         JEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020735; x=1793625535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lMyf20BlZ1h0WZ9ePXYbEch50SKh1zOCdibpTfZjCDE=;
        b=1Ck+jv+iFikF9YcAhkk1PAm1tW27GLt56Ps8N6qdBEeASp0t+nUKdNTcpcOZsjyiV5
         mu2cj67jOQVhmOkHJFYoFJmNq5NbJZPXm4xVxvbBjq7aPM/Eb9PhmS7NngnEKd13B2zE
         3EE3L662/JUb2NZKh3zlTDbIIXqLVZX8C9O7OyeAoKUOuUvfaxCsbA6CGWYBWH9GA8bQ
         R8yzymttUycb+3yh485xrQwrI2ucUkFdy5UrgmlOpS0zf4iwJOon4kiP+2yIyezQCTlb
         UzCNpcOF12jveRppgUSizA6mVrb61LizVltVUHJR5NMlCzLSbyZJo6Q0VL9spDL1JZBi
         b6GA==
X-Forwarded-Encrypted: i=1; AKwUvByQ6ZhwG6RwYi5fHVVJB7qJR4vK0WGiS8QLR1+Zwev+mFWh90eaT2uU4hwZZCfKv1+rUQ26UsFWxH9LrxoF@vger.kernel.org
X-Gm-Message-State: AFq9FYIUpc+WZQBtToL/vBjqjkOP+wsmJU95FKNPJPuElF3/VMhgxnAQ
	3l9CtUPUU8C2s/Rt79kzrrMlDj5TRo2Rn2hee/GUjSzAfcXovkyZfrCXbh61nqDxoPu/KdMF01l
	PYrz7tvdv7WkPv3fCZ/oRGzoGwu+OM1vP6GvkJSuXKI0S7iBYO/kH2wd4mQaD6Eoj5EOn
X-Gm-Gg: AYBFou3JxiGLi5atfMaT9VEZOvFzHN2GeY2mXPTqYnp3zsmWCJrztTRZm1Gt3f7QrEn
	n4bVahg1A84L8Wvk4XXUG39T92BtTd4VFzTA3licqjrf6DA75+5ucdPenI/f0l3SF30Sbcuo2ja
	H14VhiVu6o7e2ftN9bjXc7tBlZYHwn48Yiwk1ZGWQKwo0HrTi1UYorL7skFHt8i0nBY2XeMkOOo
	sQZldo/JnBEHRBIQtDHsDDBP5zobQad7C75DoUB8fcbsfQ6EQIGcFkIHEqOG4+EXe203zBoZGqg
	1GouHrvy8GE+HQ8l7cRW9XCHd8aOaBDKiS2Jvwb8vlW4WDWtdJjqNRlNs3LN0uxmVgM0+CrWid1
	R+sdV73Ove2Pd/1RIKPbJCA==
X-Received: by 2002:a05:6102:8182:20b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7ce5cc7fd58mr1562784137.2.1793020734849;
        Mon, 26 Oct 2026 06:18:54 -0700 (PDT)
X-Received: by 2002:a05:6102:8182:20b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7ce5cc7fd58mr1562727137.2.1793020734298;
        Mon, 26 Oct 2026 06:18:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445984c99sm3713290a12.28.2026.10.26.06.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 06:18:52 -0700 (PDT)
Message-ID: <343a80e4-8880-4faa-a60b-e3025f2ed40f@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:18:50 +0100
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
Subject: Re: [RFC PATCH 00/16] Centralize the ownership of power rail votes
 for Qualcomm clocks
To: Jerome Brunet <jbrunet@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <179275170360.4070168.15401690927522463377.b4-review@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179275170360.4070168.15401690927522463377.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX/Z0gtYKKILNP
 TxrI9D+fRK8njKd1vO/tsuLKD4tHYLZvk9W9w37vzX51U2yfaftGnlLrrZObf3XpC4wER/EMhSc
 7DQZknXx+26OQTdlWj2Tiy27VMf7OA1xR66UYaDmkYL8NpoAiWQgYmnTP0RtxN/rycFhuwcgTEM
 YAzTG175VwD+94zB1taoMfSMlLMKFFgKGaNZrjshbfbTcBWcMbOHSs6tW7ixihifcxYBtDNgNu/
 WYHDra2+qIASdh7IQePgxtvKocmULb/2nDggngiR6zPbosRTbd7Tm+jdBH+bgGVvS84t/xkx2yZ
 Rs/ekytFnM/udxL1tOOB8KzDiU/k0xxGifXPSfUKdvo6AWEijcsKKVEd24KatPU1w8cQAHnum3e
 ck8q9QBP9nITTp+2EVGT8qzdCn8sq/5SEgaeyl7abeEVQLcpznjaS7IYhjZiREgE79HcTlao1ni
 OJy/Auvpb+6m9qlNKDA==
X-Proofpoint-GUID: 7c84Xe6PfZbCdOqisvFSeF-K8jsorpPf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX+1eQvXD5V6vq
 rxEyh4ahf2qcCzBz8TQeA9y7BU3KEL6pauby38uAnIeUNaO7bIy+IDlFTBZHXUAxBrIyYSo/GlX
 Q3yJrODKcR2JXRWa139G5IdfdbTAKWU=
X-Proofpoint-ORIG-GUID: 7c84Xe6PfZbCdOqisvFSeF-K8jsorpPf
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf533f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=m6TPRz_fCz5u_OYVIq4A:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260052

On 10/23/26 12:35 PM, Jerome Brunet wrote:
>> On Qualcomm SoCs, both the PLLs and other types of clocks alike require
>> specific voltage rail levels to operate in-spec, but through the
>> separation and decentralization of clock and voltage votes, these
>> requirements are often not met and are never explicitly stated.
>> This results in clocks being undervolted, or at the very least a state
>> we're unable to reason about.
>>
>> The devices consuming these clocks very rarely have their own
>> requirements in that regard. (1)
>>
>> This series moves the frequency-power_domain-perf_state mappings inside
>> the clock drivers, ensuring a single, trusted source of truth is
>> established and that the silicon is no longer driven at out-of-spec
>> conditions.
>>
>> To illustrate the nuances involved, here's a couple examples of hidden
>> dependencies, as found on SM8650:
>> * video_cc_mvs0_clk requires LOW_SVS to run at 900 MHz, but the
>>   PLL it sources the signal from requires SVS (higher corner) to
>>   produce that frequency. Similarly, to produce 1140 MHz, the clock
>>   requires SVS, but the PLL then requires SVS_L1.
>>   Analogous story for mvs1_clk.
>> * gpu_cc_gmu_clk requires MX to be at SVS to output 625 MHz, the PLL
>>   requires SVS_L1 to produce that frequency.
>> * A number of camera clocks follow the same pattern.
>> * Additionally, some clocks like cam_cc_cci_{0,1,2}_clk require
>>   MMCX to run at LOW_SVS, but the PLL has the additional requirement
>>   of keeping MXC (a wholly different rail) at SVS_L1.
>>
>> There's a broad agreement that a consumer should only have to care
>> about the clock it consumes, and that configuring its parents is the
>> responsibility of the CCF. Requiring the consumers to care about the
>> above cases (as is the expectation today) is a clear violation of
>> that contract.
> 
> This is a fairly bold statement. Yes, the CCF's task is to make it as
> easy as possible for a consumer to enable, disable and set the rate of
> a clock, and I agree a consumer should not have to know what the
> parents of its clock need.
> 
> That does not make the framework responsible for it. Taken that far,
> the CCF would become a de facto platform coordinator, which it is not
> meant to be. The clock driver knows what its clocks need; the framework
> should give it the hooks to act at the right time, and stop there.

I think we are more or less in agreement - especially since this
paragraph of the cover letter is not really faithful to the 
implementation (since the ACTUAL voting ends up in clk-dvfs.c, so
essentially a driver and not the framework).

> When coordination is needed across devices, there are dedicated
> frameworks for it, like OPP and genpd.

Right, in the specific Qualcomm case we heavily utilize all of them.
For the problem I'm trying to solve, the clock controller is the
"reason for the problems", so its driver gets to carry the heavy
wait

Konrad
