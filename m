Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792573564;
	b=Ieaz2fnqBC+BeRN26etBBjBncZpVW0puSU9HvvFfSenjTPEs+D3uNRNljj13IaTPRQGf
	 KO2LVtVrEcyFDqqB7KR8mdrQcdTsyPF7fO9hO7QEWAS8na76lVTjYQlwDko1QocWPGZbb
	 vd4IKifS7EJAJDEeJFs5ooin5SOZMYaPzcutgKwsnyvHAVjYql06xO3ZeijMOq45ZcRQk
	 ZVrtLpwi6KNMMZd43ktW8PTqzhrQbXzeI3r2x8Z0p5C/FMrqYWFFkdYFuIcRGkw8PGFgL
	 7XltqwrV5gp5WYgcu402r/UXzXz6yauAbZ6OmrEKPh5sReMnOWjRtjdzfG+01Sih92g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573564;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n1ER3lUc97YATqDpNc22hGvkHDFIWxr4xKdKGaCIwaU=;
	b=iCKjnoKaUFBmXnV64ueojPIEo6Md2I0nZuzNnHFvSL1RqnQRwXT/qQgLno4ta2aENo7y
	 4xUNUz3P4sRYJ6raOaQRXhohaHvd4xpyaV9qiyz5OkOxsScIS/qJhg+uRP34AvY8SlsXQ
	 yEzq0SIhRUsRE58DPgcWYALQcB1Y6EvvGcBk8wiywESyWGIqtAKODqJNG5iiLY1TAdPyQ
	 G0Y3HaCBCQoLFkxH9oB9KUJyx4g/49ds77/BGmhYJTk0ZAtWPtnm5k0fk0jT04b4BgpkG
	 py2DEnKjkUfv+uPjXbcWQL4o/8/GUbFzvdX12vy61hqh47IKLwmAI5ntuNVeXiRsc8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gog5hrfx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqfCaeAL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701DC606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 701DC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gog5hrfx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqfCaeAL
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jIS52848123
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n1ER3lUc97YATqDpNc22hGvk
	HDFIWxr4xKdKGaCIwaU=; b=Gog5hrfx9VOZjtUe4doedrE8pLSZtW798ZiQCrjn
	3u7L7DCuGYDQs2g/qi99SRpJJKIzm+g1xO661a+wLX/hmsGgYM+yDyk7NpUGt/Hp
	BYJkX7UY0tgeltlzRXdH4wGaGCIF1NiZA61BACU46oIcTfTDvEqtfTIyGor+rXHL
	yQE3cCVC/caHv8LzATHrnc08yb5piMgjpfBANf7C/tL/f/+datDAqYgrDfu5QHPu
	SAzybmYqomti9iZg7npu50lZBZfGwZJcwU4vZDuctmpRYim81VoeESnoF+EjZcXR
	dyz3T0rt568h2qsX8n4AWtHbBH5Qpfc/5KaD9rXjb/1d1A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9ay29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:06:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9821ca96fso5119575ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:06:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792573561; cv=none;
        d=google.com; s=arc-20260327;
        b=FqFF/hNboYtMkB/x69PuMQc9uYJrNBg9Vtqy4vk10Dz8TSvZHhnaSENBazVg3trmdV
         6LicJ315QrY768j2gOfxz/rdc6x5HZLRm+hJFC6A4cQvudyzTNq4ZLPSPIM37riZ8GOQ
         DTCeM9nC3heDu5XiCC71EDDnsve2T5mFma5NN9cc4r7pzo84BLqCj4kJNmVVQkRz9qKn
         pL0QrxHfGkQpylZFAZLP9HYYwiTJ1WNSQQ/DPWCXVGE6hswTextq40mCxPLzagk8Ly3J
         Odz/W+678v0DGcRRNkrmu0zFV56VJ/k6dSyZEzx7mA9zekfxEUm9lxMg4HGw5sSBg+Nn
         JtNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n1ER3lUc97YATqDpNc22hGvkHDFIWxr4xKdKGaCIwaU=;
        fh=BiCXf9kFfLrWaqiLw0PcolSTsbB7IIxU7FhnspuZHjo=;
        b=i1Gx4KYk6hdGkFuUfbPo3mPhyDwIZ7YSsBDnjO3aIxOgdA7+pD45/uCZEjmIUlneaE
         X+dddoACQamHtzmhG+kM7HavdAlUWZUUDfBoVk8hv7QNTa+AL/DrzfYh0md4dSPghO8T
         OsffV0Cu/6BTF2IXcGI5Ju8/+J9GDgb1cfCPmKsG4ZIzwN0Gz5Ld72FC43BOb7KzSQN3
         BfVlJuMDXo6jd2+HhmBUHc/DTxOymok4TcuJgnbC1hwlE8lTB0QoSTYPpD9qgzu7AWMB
         QN5xnJULOaWs7c/6nuiIodwj2qgWkBgoCRv6dWzrD/FoQVRR0wuFA0Tm6yMSJuq+A3tC
         YZXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573561; x=1793178361; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1ER3lUc97YATqDpNc22hGvkHDFIWxr4xKdKGaCIwaU=;
        b=bqfCaeALRkvwhW7BFmLZ8Gy3CuQWtCJzio/3pE1uHM++vArlA4iDxUY9ivGPb1j4Pw
         gxKn31pW5PA3oNfdQ60NHXXFBbPjynk4ZcMBUDVB9w8dT8VUaYO62Mymn94pgiF9JN6Z
         UofU+nqf2VPo4KGxDKZ7RhKHOqISZpxj1Hl5rM/ZKO2cOIFiljIU478HQQ58NospCsnj
         /uBAYn5QG59t61cptJJyOlYRYjiu4cnnJ0EngcJgDalLzxi/6h2A2JrxIse+9nZkMIef
         Uz81fFkJmfyV/s6jTqKucWKpC4MPDVhLNSmoGWTjacQ6aygYbFfCAoVl+dUwg/NkrBVx
         QS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573561; x=1793178361;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n1ER3lUc97YATqDpNc22hGvkHDFIWxr4xKdKGaCIwaU=;
        b=kmLz9pfgHhBVFmoyAX16RQ/RFam28x4gh5OVZCCdc6g9N7olItaZXIyz3gG3Va+VZQ
         rP0oEBwTu8QaHysWZcMxxztsH9QQ+EMMws65dilU+y0/dRSHOEAmV/AjxKcl2KMkTS/t
         c6h7a9IWxdVxMILheR8YXazMj4Jb2xlLX6FzHvySqc1x0/j0UutA+ktMdusIiTAnmmCX
         5R89q/HIb/vTCQBBdmb4TEIYSZU3U1IjtFCynEWjg5UVKSt0tA9SDmYoBP+PGioJKzzV
         7CNTeR0xShNtv3xSviPOfzrP3DJDnaXSHu24dldIK7EJ4Qpg8fwHUombgJdpPpQIZsC+
         iGig==
X-Forwarded-Encrypted: i=1; AKwUvByprrzKEqpJITNqAjkABcltY1Uj2PY/kbZSnPFmOdvjJ7QGZeiuSOFSUjLFlYxuJjK4yGOHtx+9pPqojwYE@vger.kernel.org
X-Gm-Message-State: AFq9FYJtr03Yo88kuaJQIKTYOGdEWd6BnCOzMDPW11Fb439Do3VfJxw0
	twSRcVh+017EOkVBss3A//6t+7ARPsECY561NUoC08YXtuJKO3N/Zd0nnrmi/jIjS6mwq4xRnA1
	6mOrS2jsvsOls3pwiNUBBmZKH1Rt50ACqBQmyKVaK/MvzhXuEQ4+75BnIDZE/Od3zJTghhvKER9
	hcSc8T6HAvNpjHeHSK0fBBPfNf5ERQGv9TOMCT9iVV5N3uPJO3tteQ5g==
X-Gm-Gg: AYBFou2o3wW2pEPkKvd8PEdtQg1DuKsGEqtY4UdJL36L61GWSTSQEiw8kRF2o1bfywu
	Rz/2N1E7hEQibxMCYCH9cf3tlq/M+TpQ4l70js6v4/Qv3HahWWSMCi0B+liaD3GnNjO+F9GWjTv
	qLssBvPaLrTzMNClWrLBSDXRoksflt9R2BCyREAhaUAA5cjaQRlSkXf5bJmg==
X-Received: by 2002:a17:902:c948:b0:2e2:dd98:59e8 with SMTP id d9443c01a7336-2ea4396c9c8mr11805005ad.3.1792573560725;
        Wed, 21 Oct 2026 02:06:00 -0700 (PDT)
X-Received: by 2002:a17:902:c948:b0:2e2:dd98:59e8 with SMTP id
 d9443c01a7336-2ea4396c9c8mr11804805ad.3.1792573560244; Wed, 21 Oct 2026
 02:06:00 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com> <f3240952-f28c-4c2a-a4a8-4492aef3a88a@oss.qualcomm.com>
In-Reply-To: <f3240952-f28c-4c2a-a4a8-4492aef3a88a@oss.qualcomm.com>
From: Cheng Jiang <cheng.jiang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:05:48 +0800
X-Gm-Features: AclHuK9BlICWHwxCq0lejQo5U0IbInRuJeKWromlRSOMPAdiPn8Fd4RwhwbW4Wc
Message-ID: <CAOK0kb90wYEQU8e9wfQ8g_KfkfqwiQ9_ideg2=mSrU8OuTLxRQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add RF_CLK2 clock to
 wcn3988-pmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX3yCrG5+dvCUd
 K5L0IOgJMyLyL2iBmO62YM9iPArPOkxu5+DnXmoB0sbtfQON40Rxypkh2CN5OLDLYYOn1CPW5+Y
 JkAMMra8j9FYHjiVwudo3WocbGUKAi4=
X-Proofpoint-GUID: ncFGEq9D2vHWcsWkuAd4hxlRmb2VG5o7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfXzgQsDTxCMLm+
 bCBJjG680hL5AfDOWSKT9zMBScGVlrLUc5r5dyfOEec0iahay1pEIM8+exwbPsXWARUgm/CZDcR
 M+MmdS4clNi7K6yZov9si5z7nGn3d+A6+tLyccId9oMLz8IwhQ0Brrn4aEEpAztWNt0EYcP1+Mf
 OBrrA/ObAVAgJOs/+JTEp33J0tmeu5hG6jsoxZe8r2zVqalxa4TpWskt8JW6wg803C8gR+m9Myk
 KzI8GqmgRTnE8Yn3M4cehEQddqoOsxC6/ZhdoFnKNcL/Bz4Af514FSAKUBUt3IWimHKFizbt0tA
 hlKiW7PF+qdUz0ziwBbEnXhwZul7Ev14vj9Qqw6EhesifWkAvMHxhYLmEYt9yxjFgdpJXnDXF8f
 BTDN0ctYWPNF3jip6hDOc+ic5gbInPqGmk5T/5HbXzPEKgDi+KyXYiED9V3CJ5C4bDwMilxpi9d
 z/77mkM4LQEgJfAqgNA==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad8807a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=m8YJvu37PK3QkMmK4r4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ncFGEq9D2vHWcsWkuAd4hxlRmb2VG5o7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036

Hi Bjorn, Abel, Konrad,

Please drop this patch.

I re-tested on Shikra EVK with and without the RF_CLK2 clock described on
the wcn3988-pmu nodes, and Bluetooth comes up in both cases. The
commit message claim that Bluetooth fails to come up without the clock
does not hold, so the patch is not needed for Bluetooth. Thanks to
Abel and Konrad for the reviews.

Sorry for the noise.


On 10/20/2026 9:40 PM, Konrad Dybcio wrote:
> On 10/20/26 3:08 PM, Cheng Jiang wrote:
>> The WCN3988 on the Shikra SoMs takes its reference clock from the RPM
>> RF_CLK2 clock. It is not described in the device tree, so pwrseq-qcom-wcn
>> finds no clock to enable and RF_CLK2 stays off, leaving Bluetooth unable
>> to come up.
>>
>> Describe the clock on the wcn3988-pmu nodes in both SoM dtsi files so
>> pwrseq-qcom-wcn enables it as part of the WCN3988 power-on sequence.
>>
>> Signed-off-by: Cheng Jiang <cheng.jiang@oss.qualcomm.com>
>> ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
