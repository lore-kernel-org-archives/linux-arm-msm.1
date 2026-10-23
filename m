Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723585;
	b=wmMSSdgs9159XGBeaL9tqWhyTAHF+cCzOCMEJjOy9Rnotu12VWJY/NlA5clJk8AVnXOB
	 8NAPn3kDHMl3Bd0Pw0+sxIx3mVmkwj0Xj53emEINWvWiNYE6mtkdduDWUGW0mnsWvuJcE
	 OJw6CADjPD2u3vZTU/5PzqYXZvbJ/j6aYsqHuD7Lf8Kwg1MJ7rWZeArikLiSSyJAjvnMv
	 FQ45zpWWC5Lfqg+Z8X1LK8zWfxEvRK2ZegRbWD3TYrMSCxdehIVJDorlpvKpaB45WeE2B
	 B6/C1bGVOpQXA+kNUuVcyI9Dstm4OE0qYdN2/DLFSgBP9Tn8qRQUWLYn0cLPeSuNHVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723585;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V+pqjCEFgknm+G3XGUd3Ph3K5ObbbOwQi0pMo2Pd7bo=;
	b=HqFcA9drI52r1XePCougyhGDYe2t2jcO+BibovTPu0GuGQARBL9jljqNxsHbpkfp7aGj
	 1wfO/apylX/B7gt8Kp46MDFnrgUSkyPx4Sk81iA2JrdE1DROaophYXE2zJRL2O7WuCEZs
	 8sDYH+FHOSI8XLJ61frlteUUVU/estR9HcNr97EBfW0mCNrOi5C5qMbnibpF1pk/iDa8y
	 4L1nDNk8KDCCgHRwDJqN9qPvqIB62VQ89H5YTFZkpN1KEYY86kPQPSrEemuwZZUwnBsrz
	 uHCfRhwXfgRPJNJojmnyRZRFpz/AmBoq2a55IUNhErobRKTssY1pzzcGkrWcI0uFnhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WZBO26gg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbK1vZIo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F9E606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5F9E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WZBO26gg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbK1vZIo
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FKHe990152
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V+pqjCEFgknm+G3XGUd3Ph3K
	5ObbbOwQi0pMo2Pd7bo=; b=WZBO26ggeAqzfQ3dDhim0tuC0CZ+hb1/CXGB4rc+
	MANT+wG64BHCQi6V+m4/d8eIoUyoSw1m/pC1bzrMTVWSjOToNS9t4Jaz3+pby4HB
	FMzpCbfu+i02j5x4T0bvCoBxVNwTVCglkXlmQF+6iD+V5gLoN7/mBgRyLf6nCB6V
	ROxwX8cC7gIPcyAloxPTf8ECJJUgz+VIhgkZvWM59a9JeMDL/Hyf+GyU6n/mPgLU
	dVA0w2UjNUxgoA1JWsS2nWGWTWCOWNF+bjKGMhw1sPPXUkCDeuMxNu/4cAMqXbFX
	471fOfk0Cec8WKylHbeCCm+CzMtObyeJ4+FDL0soYWGiOQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahsy8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:46:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso594546eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 19:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792723583; x=1793328383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+pqjCEFgknm+G3XGUd3Ph3K5ObbbOwQi0pMo2Pd7bo=;
        b=MbK1vZIolr/333dQnmuUMJA4Jz/4Bex4fIoe53z/aFDxEIrv/tyiMTTi1Sfg3+oM3A
         AWA3/7KGn2UA+nVvsJI9pOefD3vhR7iNQFmjQ9cagScMLfTj7vlLIDr91euLoBZxUSwt
         uEUlBmAYHhgNuRSuiRbRbLpaV6+XbMAK7o0IDIzRaJPUlJAWm4wFkAxbCgKidp7KFGY+
         dddMyo2TSBg4aqQvS1EhBFQQMP+Kex0xACsIPDWoF6J/8t2lIcoCf0bO+jyQ2iLWbFBU
         GKu9n24zCDNKbAoE4e6eKLLN04SnRi4dBVPwmFIxfZJTCIARdSlwGHUizFBmJSwFHt2e
         v6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723583; x=1793328383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+pqjCEFgknm+G3XGUd3Ph3K5ObbbOwQi0pMo2Pd7bo=;
        b=HbsChZ2fEySrx6y+CR67n9vLw/0TRozwLNfxH0eRK+qTCVoxeZY1Vnbk+gNvdcTI66
         HlirQ5AIjatkOzY3kbktkahalGUXMnY5ewRr0KkfFZtRFjwER6ep+5eXs+wVa7N4Y0Ld
         QXcm00ZalMjxfUkXrAZ4MFxjp9Pdk9NanvI9+cZwsLfNH8uiGGuNafW6WSPmCLyJ24t+
         0weA7lVBqKpSEdr2+YOI5cHIs4lFdtdHaW449nPLRZmfJHzKMi81sOQZ4VQouxX8iQXV
         pFflsdb2ByWMshCMy8m5iUG8tu7pph18J39TRof4/iUm/PRrAZjm5jj7Y4M64xLUG90O
         dIPg==
X-Forwarded-Encrypted: i=1; AKwUvBy6auDZN/5hK1YbeBCvtQTXKbxOxZYFBGLEeNlbR3Rcub8LstpbeAGBFUr6KX3zJysGGWvrZZ2qhdbfB9lm@vger.kernel.org
X-Gm-Message-State: AFq9FYJEujs09yFW640fF9Hdq3ugR6sRvio2Q7HyMvlHyaGh5DUCxvOf
	cs6j/krjvzZBWMCuQTvRHwon4sOAby9QagtbajQKTNv+5rNEvWVTT02kDwQ3Zd5eGHJDpcWvfdI
	06IMFGy4rqkAXFTIF8RMu6EeggqgV2WzWEJ7Wg0Hfos0/t6ghj7jfBYx195Tuv509OO73
X-Gm-Gg: AYBFou0Tounca/20IXiSUulWqrudweBXYuYkH+lKWmAQfCo0lPBzCczfjcJP1BE0PE+
	E8cLBw9I/0jSWj27lGWlYiJwS2wfxbfoZuHG9s/r1XmojFQKUmqQnVDdTTowuALzTCGPYwsi02q
	jo78QsavOKU2mhCU66m4ikAP1dzEfSod88w5DrSKgwGwujWZfJGdG4BKza6m3eCYDWXKEO0T3Q1
	2MxCoHsGafVTKj3XJR2j9Tv3XF9vahxskKHEKPAIUHOi3Ic1/FvbLJOL5DTsCzaK18OlW0J5oun
	3A3O6ZCk+mPlSbGLUEdX1Ld2mvcG6nmHusBkcYc8Uubo9UQIoCWUAv0lWQ8wd/wAn/ulPmRKV+J
	7/vbRqfp25dsYJUrvaRfNOeUvmJo440jjlzBZrsgieA==
X-Received: by 2002:a05:693c:414b:20b0:367:5e31:ce29 with SMTP id 5a478bee46e88-369d97c63femr1366791eec.20.1792723582643;
        Thu, 22 Oct 2026 19:46:22 -0700 (PDT)
X-Received: by 2002:a05:693c:414b:20b0:367:5e31:ce29 with SMTP id 5a478bee46e88-369d97c63femr1366763eec.20.1792723582146;
        Thu, 22 Oct 2026 19:46:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d892b1sm2312032eec.10.2026.10.22.19.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:46:21 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:46:15 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc
 DT support for Nord
Message-ID: <atrKd0jDer9wAznR@QCOM-aGQu4IUr3Y>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
 <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
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
In-Reply-To: <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX9JOc4UOaDQ6v
 wXZkqowom20QKrkRp3A1AesvgdGvPWm6/516M02jJPJew0JRTdRfNDsotR25e4Mj9NHQ6w39mOk
 bCstYVOaKsrTJdQ2Bc/qgA5lrtHojv0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX360+mFcopTUk
 +BJ4Bqe/HLeImUplpYzW0qUHJsAB0kf5BMm1wSoBzJoK37vpujOrsRJNkQ7q/qsoFVEMxuR86bw
 A8v/JDXrhDIj9U66a7ZLOO7PNVarGKA9Lx4Zq3yUfCEcLbKJEqM7WpjPMXE5wR2m+TOPjDePza0
 ewCqBF2wF5Imuh3mBlckgAvmWudvjVgeMYjkyQVEI5LHlM5QcRVlSH0jasni+rQUJlAOu6uoJQc
 WZT8eG2rdhUqNmBydier39lZdf/2JTBkSeebmexac+soMLQ2QEe4vUdF6ySvoEgFETJ4ms+9GEE
 BUGkFcQUIoNtDQwsJnPN+xkHY/ybK+ShfU6ZsNNcnwP4lARxFV+8uvkrqhtPlL0GFkKZR/lgYVX
 U/ACq65V/T8P7Mb7gODhFa/h50QJ1a2edrb/jYEhTrrkQvQUIn+H4+mRdCcy34BmdZO4kIM84kK
 0wr2w3i+LzXe+eNwciw==
X-Proofpoint-GUID: d7jpG8aiiwYGYBUn4UXvOPvAq2MPIhNj
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adaca7f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OoMBhQ6JWsPECC_GQXkA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: d7jpG8aiiwYGYBUn4UXvOPvAq2MPIhNj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230010

On Thu, Oct 22, 2026 at 05:27:01PM +0530, Anurag Pateriya wrote:
> Add the SoCCP (System on Chip Control Processor) remoteproc node and
> its SMP2P configuration at the SoC level in nord.dtsi, and wire up
> the clock and power-domain dependencies shared by all Nord embedded
> variants in nord-embedded.dtsi.
> 
> Move the SoCCP compatible to nord-embedded.dtsi to fix binding
> errors reported for the Ride board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
