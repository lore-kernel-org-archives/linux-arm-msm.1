Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6F647D462
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 11:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261294; cv=none; b=kOnAJWgkVw2AunH73UEqF7xJRnVaCZsU6uph5FpRNUN1Cqt0hf5O1hqtMrC5qoVSeZdOjtojDUxw4T63+in6qKPAzH7YLD/BVwcs1tPvH0JmRmqPDNGqmxxaVwSNLnMBaEQE9PdQamS0+Qrwi9XLsWXvftA2Xi95mGssFr6Pb5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261294; c=relaxed/simple;
	bh=ViR2iGgb2rl/bfDR/Xx0sjUdrUTgmjM1SnhCw1nK+d4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ofeOmxjsqpQYy3c9HzYe92tUR7qDoWW/K87hXxh0lxTJa44hQ2PlEwXBm3RtAwuYhqNDZ3I83dK8iugdrIsWA1l7Lep9ZwBQwF+vuHHUMX5I2IS6K/9fMs+99P8ccvccbdt3UXpsGgohA44G4gT6WSiKUqJD334Rp6Ei4FPN4kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6or1dGN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkiuuHFJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6or1dGN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LkiuuHFJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJe6R2494589
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 11:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bvnsw5icBTlIb729x4QtOvZH9L53U6Yn6sIKAtjAwp8=; b=Q6or1dGNuI2kUo7I
	fVLlnSIUmQSZt/M15nBanTedSVD86vAtijhoHcqDapllWXZRi5HQKLpL3aRDG3J/
	GgVlVEEf8IS3VhJPTs1B8361yhflSvGFq9tGs8goRLWt0R4Mar4pTGvTfKxNCaW4
	v5yJxnetzcQWzRwyqee+k9vm3zsWwWnYBufVrUKfYwB45X3v0mRoP+jQUFdNvtP5
	ERTLfC4NTKzgI2HSPeuIXjdphf42Wp9xDy03huBVsO1iRV5mudS2YdlllTOpOZu/
	MLYXrlE/Y1kIAAJlxIJqvLG1iIraJenfKYA8CLZiJdYQ6rlDlbS2i6QRGNcGWxIU
	8JSwGg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh1rgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 11:14:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso81142885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 04:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788261290; x=1788866090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bvnsw5icBTlIb729x4QtOvZH9L53U6Yn6sIKAtjAwp8=;
        b=LkiuuHFJO8OVGW+m1LbFLUWgEyvssw1EdS1wLNXBg1qG/IZXU5hhwOr45dw0rGbPV/
         Z/92txnvAw8apGmOHLfboJwbzt+iv5sWQBjadOvRwfu4OGGQ+juz7deVGRJs5s6Q+31o
         Gfh3b4cCMWnVlQ4zMjcAmHobJKz9JcsyWzv0yHAms3LgS9ja8OeLcffAVmzjgyQPKgk/
         9WIPdZBeiljh14Fhl0Z3W3TcPBGboORtK6WI2gkD20uoLH0x006Pw7t0jT1+l6hfsqn3
         EVVtWD+WBaGGSqqJRiIXMxUJM8Dw0Ygy5Wr78rjTCnDuNCFa5IavqOieiTMyXJ7F2v5A
         u4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261290; x=1788866090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bvnsw5icBTlIb729x4QtOvZH9L53U6Yn6sIKAtjAwp8=;
        b=Bf2sFH2B4IPjFuAvbY9uH67WHNhARwtW7gU5xdRPtCunzcNmIswB3b7RJMzljW1VYt
         Cm191vrJs0/5/Pqn6miiuLJIDtKGuWpE1+BtfsM5h5M28vPHwqBO1G/Di4/nVL4H/1qa
         ufdEZBDTvmmAcJQlwlh0TEhTvKu4vq4cw4MefKCBW7DEeTv7ztHTMHQ1slHhX0BChRK0
         6DqAvQ3zDqdEEpHxzpu2fyh2Cl+X+f2lD7DWqibRYcdggf0PG796+Zc3CXe60UlPHEXW
         P951gQ3nhW63HlWIH4OxuCI3dXPbQOqnpOdS/gc1eSrpiSU8dGPe9JxAdR0HxzeSVDwo
         EiCA==
X-Gm-Message-State: AFuF++mAhiRDhptUPxT2SN3bz6yWLmf/nRQe3nA4acgY57Rsuf47Bo0i
	IMGTtpkijj2SYifYh4hrf4zy5EXdDLsBmONUz0LRcVuU0VlmF/XYUxumiR0zJ14V1O1MUlAeVeP
	s4FX26v5ryZWAWdaNEx4T2DZ8zvns1etXWHDfe7N/9Gq+HtW8LL/5MHwvQcJRzxhmiLTt
X-Gm-Gg: AR+sD11ExEfqCb2u7vLjKcXRI1nweiundt5AHExBEBqjJhT7X9zABbbGYus37H/SSLX
	0zjbzSHDce9/SqCdoOy3lJu/MJR3IRlSIlUU2KCSPxVyNfGehsyAVAto5ORcWDQw2vKi3vsetzP
	O4PYxsVcGhMge9/WsSmQKRqPuwnlM+prOFuFXYWXADNgoeHEvy59jZ0qBsKXX1vH6nGFF1Jy9VE
	UhSzOry/nEj1YyTvFhTV2NDYo5wjRDz5zeWU/OCcRkja7CnDIsd1u1BkISbqQI67Mfva4oqQm/i
	jst7TFnK5YpjDvy7cETbjano1fx/goC2qcEsrRjloU6JvakqdkkJiyU6R1FfscDsWQdydrFCH1k
	3l4XMZ9AXOjLfk0RbQJkXDw==
X-Received: by 2002:a05:620a:2255:20b0:939:4b2b:b831 with SMTP id af79cd13be357-9394b2bbe4emr267542285a.3.1788261289835;
        Tue, 01 Sep 2026 04:14:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2255:20b0:939:4b2b:b831 with SMTP id af79cd13be357-9394b2bbe4emr267537685a.3.1788261289181;
        Tue, 01 Sep 2026 04:14:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b2049sm582370066b.36.2026.09.01.04.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 04:14:48 -0700 (PDT)
Message-ID: <109b0a77-82e0-4eb1-868e-48a8c592cd6d@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 13:14:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-dts-qcom-eliza-evk-enable-gpu-v1-1-a7c3fb27b4e9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-eliza-evk-enable-gpu-v1-1-a7c3fb27b4e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfXxK0SXv8Bdjgy
 0gjcmePgiwv5UDAhUn8K/TbgD5oZTLhT86fL4UQDzss79b5TkKO/yCJRE2p78x2JL87ZaBJeDv7
 uJXRcALs7m3trMJAscpC7seZhjqPiNY=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96b3aa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Cuw6cLIPfeE9647f4vcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: PsyetRTY8cj4l_2czA-QHEKTp4aik5Pk
X-Proofpoint-ORIG-GUID: PsyetRTY8cj4l_2czA-QHEKTp4aik5Pk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX5i9hAp8r4R37
 zCH9EGqKzYm535iXjAE2uhJKzp4JFp4vF1KG5pSqky2XJmhxUJHtWgDK29kEtanM3aiuclMMQgK
 FIwY5q6XjN7BAUMSD1I1Ce9uGQnSSpVyhe8b0lQWWNg5N2kt3ptfg4CC+QXMmNEhBaliSrOlmg8
 rsu0sk1XlTVbzKOBpgS5O6qzfsmCLtgNqr4xdT3u3VhNzMmrNKFJgQXvSs5qH4YaGfyhME3mGue
 7RfHpxFIXgw5IO+5XSeM1lKCLbH49ULyQ0L8m4NedCX96qrX4gvoEQg45piWlULs7jU9GquRzdb
 vTT6Sa1h6NRi73zLP722/MtTO7n4EsL7aljWoqMR8/wBMGKWZ/7mK52rhzkVFNNBMlMD4gQ6t5E
 waYK/Ebpqg2G4Kp8XMIfnOdHkcM8O/wPlw0Svpkl7k6AopJe6G8wSYCQ+atnD39D+gRRqlSBPWb
 sjKmWh11LW1FtXwBb8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010099

On 9/1/26 10:22 AM, Abel Vesa wrote:
> Enable the Adreno A722 GPU on the Eliza CQS SoM board and provide the zap
> shader firmware path.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Either "Adreno 722" or "A722"

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

