Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092EE3346A0
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136349; cv=none; b=gxO/XAVsP9JpERxqSKbgJ+gKkdETni/33ecBt+zp9FdLKC+HPj9erMsBn4QeV9ZiQdwU43truIW81b+ra6/rDwkBPa+5UBMux8uqG+0xrXV9ErdToH0lP7qoW0fEJbfXqWVh9iK/QBg7Xf5TDcmSKQ/Oq0YKe5jR4kSr65pZWF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136349; c=relaxed/simple;
	bh=+kkiiRjZHe3xphxiX+wbUyacK+O5ScS5yTKiei0y5Xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SFLOAE7tyMw4DC15E0bNdmV9Ow/s17nzq1h7dyQNzKukijLEyMGJxVFiTN0EEIRlPmLeCjNvfwLg1K12kTXQ9dErY2qbx52F1WS5NRvJdL6WEkOq7R5ZVFGkojOV7n79B3pWDb4TQ/GF/san4HtRVTSOzn9k2mg7kuoc8KLat6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kiPiu4L6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TYmkxDNu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kiPiu4L6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TYmkxDNu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCirCW2978640
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ti8Y3CyAOeHmbg13Vfb4Ss8PRlQ/795r/aSAHXb4/A4=; b=kiPiu4L6rMH1sJmJ
	YkLYyXbMNXiTRmOLGv9/1dyKO6a6QqbdNUsJfVUdRnlz9kRm0Z5S+f8MBb31XzZl
	eTut3pl/Ja220Di2b06ysIvsUEHs583BM4/NrBZHbTb19tLGtB1FZNMYJkcViqeA
	b5zw2D9CBAW6rw8hMgmAf/WonJ+C4hVy8b+pNgMglpvULHMKLAy/N+PdViwpobxl
	gFP5Xsp3UH+c/tA5UiIyXH5tKUXo9vDRzjKLqgK99/9M616l7+K8I9AwoiiseFFS
	zGavU6Nr8YNGc6UKDTTti4QTATeYqm7S1no5pPxfgjaVewwpRsTaSh5oY41LMfd/
	fzi+QQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7ucjvd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:19:07 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fcc331099so38315137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 07:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136346; x=1789741146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ti8Y3CyAOeHmbg13Vfb4Ss8PRlQ/795r/aSAHXb4/A4=;
        b=TYmkxDNuvgGxLGJY7NjoFKhrpi34s3E/v/aVQsdWWfGKCy6AhteeFzupuWLtd3sqXs
         ERM6pBQjDAkKZaFPe8MQOG+hN8gvktpKfr/7e0LMt3B+x8uYR6jtFff9Zos0ZCx4MWDL
         /KGMG7xh1au5CVLv+njgIRFIASRXE9Py8w5rRhyEk4B3Hv7qJDU/416jQBqPM/88s/Bl
         fzFmH6bwgWP48AMmP8PwEQ1WF4Swuw7pwU/4lTQ47xYko9tVrnqSPlj5LGPInqMnlKqZ
         3qCeKs4cCypkJymJ/mqv10LZ42rlTAOZ5yOmCrbU64/XM4w/7B3juL3sHuRQCFxqxk+L
         bbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136346; x=1789741146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ti8Y3CyAOeHmbg13Vfb4Ss8PRlQ/795r/aSAHXb4/A4=;
        b=mSQKjKdVSmNhBwIPVDNPrNF/21oRopdXfHoaZ+kc957Hq6Y8MW8bnD8xeAU/l0YP+A
         SMKV3eOvVXh0yu5Ytfb81GHDhM3fo5wdcpWTHm7SQ4bPElCqGp6AMJaZT7wBF9cmIMUL
         kWxA9XgTPnUCNWG8zG4DMG87had9hzENkhL/DosRB/v/kBdqLuqjxObnALD/MqKG/Ydn
         CZpPONREVN4RpxI/F9UIOzZ/pzIioBKpSAPzn8KpVEe6X0QyXqpV8ghnIoZ+bJwceZ65
         GwTawdZaq0yScwhfQqEuE1ygjSLFZ+pboyOIjAEz8hyjrCS8MfLoZG9ttdQBC58Kxcjz
         BmUg==
X-Forwarded-Encrypted: i=1; AKwUvBy1D/t/FxX8qaBSNatjC2MDJ+3W3mLGzslSx2fI0Q+Wd+hz4LFyDHqtY8C21gRfGZcC7nlo8rGBRT6m2nYk@vger.kernel.org
X-Gm-Message-State: AFuF++lqqscVJJ0NZfTqzaeuAWpV3+GGWfZsUHT4nCQQHBoQ5k/Ghvm3
	8yCFEFipj00ByrTHnDsiPX1gxYod6/FvB0+k2CdgnduaMh7y+X/0euq/ZqNCxPGBez7pNYMEW1x
	xgeeJSvUTR/XR1Q67XHywdbkkhcrCH20CUYpDpBJdfOXglEcir8xEpgWy/pWSVhk7vlWE
X-Gm-Gg: AYBFou3fd46PdLaHKwEk2p/GWoEa0us0WsyMWOe2rD2ryusDR57I9r/aKTSKpHmePUa
	V+849ZPdNIeT1ECeai9/JbvELc8S+qIBGZmPQ35qsR8xzAqFInQsNvX4FuxYZIkSukXQR2XAArp
	uIbnNtaID9/2L6EHV1xLQ9qg+rvmEzrkQpK+6+L02D8Ycwdf0NwIqXhfi1TyHMvKdwQK6q3Ikpq
	MX2ilKgQzFrnGuyOV7uVB7Eslvdhx0gkWbmBLhem07B78gJAXSAb13b8PYm4rLPBNLizU8NA8y8
	51exfVvjxzzo/OEJF98RoD9KhLS1CXZ96nHx7HmA7Zb0/mOgre7R3m0yqbqqI7KgkbHprlCXwFf
	yUxhX8XywO/rkdoAH+R63Tw==
X-Received: by 2002:a05:6122:6b06:b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c8462bee0emr1650463e0c.3.1789136346215;
        Fri, 11 Sep 2026 07:19:06 -0700 (PDT)
X-Received: by 2002:a05:6122:6b06:b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c8462bee0emr1649949e0c.3.1789136340908;
        Fri, 11 Sep 2026 07:19:00 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5964c7asm839147a12.30.2026.09.11.07.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:19:00 -0700 (PDT)
Message-ID: <0401ba5b-c308-4e54-9f6f-58005cd19a0e@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 16:18:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] arm64: dts: qcom: shikra: Enable audio on EVK
 boards
To: Mark Brown <broonie@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <feee7ac3-f5e5-4677-b44d-34be0c784110@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <feee7ac3-f5e5-4677-b44d-34be0c784110@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa40ddb cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gfYPUWtuRM0ccBUoLM8A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfX7mczRX3dQcat
 9wLrMTO3SLl4Cy/1exeI+V7S9zRsC/LeaWoDynkZRcJfxMftyB+7KlgtlMgmEYAsxEr9P5JV1W0
 mvVqr92kQYF7P1YeVwJwT+KnzZT7UtaU+E4XVSDn7C9g4Mmuty+fzZAqDwE43wfqZzHsSVY/jRO
 g0TVbeoD0HUCREeMxeoweyD4YcGyLmeJNCMYYK9DIpyY+/eIYWshvlnRoCpkuB6KOcNfv+gkeGU
 ggLJIum3kCliYv6t59pSATyVoVeNefMKMH+hXpoklv5IyhOEaRqkw1Bq5GshqDM3P4/z3q7mIFf
 qy+krV2OPaMueBD6dY5XBNZIVttYhLQzmYCYGU+4c8Vh+Lo4kuPqWAENuxagnzIr01oWvpOzfRa
 apBsdrWfaoc8j2D9pOkcGTcjl5StsoZeSwSlfdGtuMrJPckxybCq8mzbRO44LxtbyA2T+EyoNTm
 6Go42NfQ/9tEE0mS/2A==
X-Proofpoint-GUID: dCYasnLPsjc6az4Pr4It6w_3fGAPkXLU
X-Proofpoint-ORIG-GUID: dCYasnLPsjc6az4Pr4It6w_3fGAPkXLU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfX0AoLIHN+cWey
 Rhj6ll6TRwH+kNNAixipH0LBvCU/P4ByZh2yQKWy6Kin18oNsAKCIn1w7fftM0GNsFpiwbNr7qC
 kzoIhySF57n6LooGjfy4UmSUQDKzdyM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110200

On 9/11/26 4:05 PM, Mark Brown wrote:
> On Fri, Sep 11, 2026 at 04:46:33AM +0530, Mohammad Rafi Shaik wrote:
>> This series enables the Shikra audio path on EVK targets by adding the QAIF
>> CPU endpoint, GPR/APM/PRM services, SoundWire and LPASS macro nodes, and
>> board-level sound card wiring for CQM, CQS and IQS variants.
> 
>> base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
>> prerequisite-patch-id: a056f645f45682f1008b321f5e639505f22bb979
>> prerequisite-patch-id: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
>> prerequisite-patch-id: 32a1efe2e364ee15c466f496b1ff3128e5326c66
>> prerequisite-patch-id: 1ddc51582586120795d86a2ff9f0aef20c0e891e
>> prerequisite-patch-id: 1e68cced9250cf9fdfbb8cdc27ee8ec47ada4a87
>> prerequisite-patch-id: 99245529321cadedd30d9e38845b53dba3725de8
> 
> As I've said before could Qualcomm in general *please* stop sending me
> things that don't apply.

Adding to this concern,

prerequisite-patch-id: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43

happens to be "Add linux-next specific files for 20260626"..

while the base-commit is next-20260910

Konrad
