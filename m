Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451500;
	b=msmbwQwbfYVUVJkHgDMrHUvMEaUDHafy8aWLCemoGPmg22s/lzBJ82R0CnVpUgEXkCUi
	 wifRH4wolV6iecygSO7uXl+kBQ9SgIgbrKxNgDFcu8oHgcSrdoX4rbfBKD3Rq55TgEt+n
	 5kSwFJ4azgD7mxgpzceT+DVkAv3HMbEMe8Fu5ZjWCySVAE9bm0Lih5RGSK+txSU305m6N
	 vR/fW8W7gHgUzrJRxCp/hKoiTD+zLiU/m3OT8qXHjIrhDCBBE5Pq8s4ICJGN/rwYe5Bi8
	 J3i48m3sxHSgfJT/6/5LLCy2zixqSgZqUOP9NZ7cRF97liWA/mr9HAwkKrERQyJ9vYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451500;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7NOwNcsngTEaHkJEW3GErrX3AAbJGPw+NpkX8JQVxf8=;
	b=Z+dS2IveoeZBC6P7y5syS9n66r21m3awV3HU689rUr6tW4Au9Fy1LKFCe9iFfEEeW7nr
	 PgfCfHrJOUllNeoXnWy6EIewiDi/tMBrInQq6k5V0WlbWJw9f2hkEDTNNCBGXzOThhTGM
	 j6CLxVeMzHPLvZ1oesVDKFc4bg2jLGKJrvKA4NNoDmwepbXqk6imKipGzrIWG/vfqYsP1
	 xEsJAXbrOmX1ykE3xRbgwfzL+9iwzJ4HUxHKMfFYHD+e2NWf8975FG03jEsCSQcL/r7SM
	 JKZzsJQufBhDdUxIW1efD29aWV1Pzc0RLxKrw1c346linzFzqqIMpz2umOM/Gxe1jTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QcKmy7MB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Eyqj0/3F";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29403606A32D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29403606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QcKmy7MB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eyqj0/3F
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGpkJ2769001
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7NOwNcsngTEaHkJEW3GErrX3
	AAbJGPw+NpkX8JQVxf8=; b=QcKmy7MBb97K0QSzDrScF+1C6T/GrGJV835J+s91
	C3aEIhawydLZuwr+h4N6LczdTRoWzQz+uvMIzBc4v0L6FwFutC4oYF6ByQBxJ6++
	ueIbk2J2rens3k5vfWYP+lpbm2HrnFRkiqROorhLEvZyhnZHY9e/g1prrWfEESvi
	cMjR0e5miMOSPx1mk2CczH0PKj7kqkR0MFOomk+4VsGf0ff8s6tpkn0d2qn9r9jA
	E6uMUEqEPbKwHhiKoqaiZIB3pjuEXks9yNzrw+ashRqA07qZ1gX6F6mRyowGcLmR
	SgotwrH6LARog6V3X9CoGa8pWa/YEgdQl6mcKxXmkAW+aw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1paaxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:31:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so3931287eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 08:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795451499; x=1796056299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7NOwNcsngTEaHkJEW3GErrX3AAbJGPw+NpkX8JQVxf8=;
        b=Eyqj0/3FvIPMyrBKTVmQg2Hga2RoWIkPrfMJDxJ/Rj4fdLvrQQm7OLtNV4+eDTYU2i
         mP5s6izCvtG5YkqEGqv54saYqJS4a8syZp7aeVrV58X26Nf+L4b8Kd+b0G6MgWY64OhK
         phaZVhJ/PW5wt2F++4MTQkLZ7r+w3e8dwk70qCwJjijO6Yw6pQg9CKSa8GH5kUPTitjD
         yAeGDbVR0Pk/ZWkKsK2jEu0/Qw5DRoTDzitUM0VUqhwsI0QNA4vAxRCqhNUgTXSFR9n6
         YYBXe6imDVkKZeyb7wVZNtHU9HS06aZ7yo8kqKJCurSxlWgStBVukjP86JOvVsWyZFdn
         qrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451499; x=1796056299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NOwNcsngTEaHkJEW3GErrX3AAbJGPw+NpkX8JQVxf8=;
        b=BC322Ab4y05VB4w/aKrN7yMCDAxMXzqp6nt+YEZYqUxYJ0XLcG0l0Ui7I/1iwAtwEa
         e4JVG9Gp7yvFso9z7QecwFBdBP1ENuatoTMbHgfL1f93q/GOfQKAzCdyN5rqLKbImzUb
         GDheEsURHf3GBdcA77mLfrwSnP3o5GSUny5dCWR7DO8CHLghpmsTNSMNdIClI9Sl2aot
         w0STRGz4+jhR2Ht7GpzSLY+OZZ1an3gEre+upcRSs1gWUTzvn+00qfnkZtFE15f+3ScI
         R/z1iyBfrDfi7e2DJkIfM8o8UE1p5Yzjam/Qqstv/iEtRBwwkpAb6+P488Fwo9sE48S+
         Q9IA==
X-Forwarded-Encrypted: i=1; AL+hErGOXyUxCglFDBuK7wGsLxv5nRKIep5BzwxNh8VuKFMgKlrfB+Zv4qOcmJKp3NyVyxlr3uT0ltvNLwtP+nps@vger.kernel.org
X-Gm-Message-State: APuU4Z9P9LavF3BN0pf4e/nROSJPrXOfXhkzUm/GJsVqgllGXddEGBKr
	++W+DjyW/l/w5vi7fGyHRSV2CG3jIsziaxAY/jYizFpXIk3mj9jHROaTnhKdDvYYXvYA1QY0GaU
	TNiN7KUkjgs3+7smy4LgVasw3Gqtdp4OBWhBW8TBl5p9YIAzWQoLslbJZWEbUc8k7/vWF
X-Gm-Gg: AZFdTZdo9sp+6igbwcBF8qOOQREhCTS0DMbvnnhVt33t/clv5wplFEgfVu+bQri2qMv
	csf1lQo5pWp4Nw7Rk65BVUkD/UjzlAJF3YT2O1ZZB0jEeMoQun8utaQQAWtaq3oHETPEVpK90ZE
	XtFmN2fxOq/WuUK4gqbZ5VDVrh1UGxb8HOuo8Eq5OdFDMuHGLjiE6/xVKzJnandF5KYRsNoUsXs
	qITDDk0cGQ020GDVaCUHdNdX+E6B17MCrGbDzU3Q6yX7hcB6VUgnhdGpxtEa12DolMcGZ+qJLbM
	bkTMAh1cTc2ve1uU/MO/Lts2Ch7GsNIYhg4idts3Wl8CgbdKV87pTmGXOGkbzb62HJR27kK7Fpx
	GLAJ9PLBklVq49lNPbzj0c3IjyJoYnTUlHbaR2n3BZPFzBDd4DxfnnYAhZcgEcvfyeCHXdm/f/j
	vU
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr10557997eec.18.1795451498527;
        Mon, 23 Nov 2026 08:31:38 -0800 (PST)
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr10557970eec.18.1795451497840;
        Mon, 23 Nov 2026 08:31:37 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm38685149eec.12.2026.11.23.08.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:31:37 -0800 (PST)
Date: Mon, 23 Nov 2026 22:01:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: agatti: Mark RPM message RAM as
 no-memory-wc
Message-ID: <20261123163129.64fqkb5jniwitmwi@hu-mojha-hyd.qualcomm.com>
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
 <20261123-rpm-memory-non-wc-v2-2-3e868b4bfa48@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-rpm-memory-non-wc-v2-2-3e868b4bfa48@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX3C6ePnvySPZC
 vZKmyyWEXIzXckwY6NIj/h/qhmd68cn+pRcFmxBOUbiVDM1ORq39+unMfp/nuGacSLSJPeYxZIN
 jnlRP6LV4LmsMk8NBc641PmGf005DgWcjnUmYwFw4x+rB1lsRNvtOWpjDm5hb6KSvFYuLU9D89d
 JDYMSzsk02DkECF70i/qSo0PVlMyiV/GU77CILHpaxehAErPSVsIca9LOqOK6VWeXNmIiEsGddf
 LEyUyZYI43T0BDapw04UvtSDhaG1KX9FQAa14s1yBlAlI9GvFtrypscNN6al9NxmGzs9LlAA8LN
 SdgW8ntRFWih7DIam7tiqw2fd+Q97CnxiQvRqzoE5s3YnECCAEEhdGf+rHk2P46I5Th81jch/I9
 lGRPAYftHAxBa6eitPZXOHEYWvlJDEED9AGqw2UZMQLxJJmKpIfyk/cVvp8kTu8KeCwhKvbjkGL
 oet+u/MsUSG3tfnUqbw==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b046a6b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=wLgbqfl3iQV84jYfjRYA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: P0W6EruXfku4wSPy_KE37bS_Dadc4d3E
X-Proofpoint-ORIG-GUID: P0W6EruXfku4wSPy_KE37bS_Dadc4d3E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX0GYx6We+Lm26
 O8YSXTg9JGSr0GznAWUJ+LTYGx/WlJq/ShiAk3KHEiYJ7+eC9nZAzqV3utX+Ms3KUH6stoUDKiS
 4IOrvVd1MukIaOt8+2yEPUsYOoLgO2c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230065

On Mon, Nov 23, 2026 at 11:48:57AM +0530, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts.
> 
> When Linux runs at EL2 (KVM with VHE), there is no stage-2 translation
> and the write-combined mapping takes effect, so such reads can result
> in XPU violations. When Linux runs at EL1 under a hypervisor such as
> Gunyah, a Device mapping of the region at stage-2 hides the issue, as
> the stricter memory type applies.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: e3f6a6994041 ("arm64: dts: qcom: qcm2290: Hook up MPM")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
