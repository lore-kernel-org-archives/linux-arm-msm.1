Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462330;
	b=5YUnzbcKzc1fwKWBnBExZg1xfjSs/AWjw3mi3jWRuvpPXZxqGD1piYE5TNJ7HytMd8FS
	 xgqU/G6hyJVnb/0JcwfHJ3rdRENwYjAzm6MgWXPq+o8h9P1WVvJrcyvkMqbm4Y4x6wQit
	 bTIVVca748obUXr0nc3UDuU9Yyss9vtVVOzmHfJl0X21J7SuGXRTWLyySQe7UWieZwAeN
	 myAaNQqA3z3d7KZOpR2RGyq+p6Ijo0W7H+Q9E3mseI9MATBaU0mXHX9Ydy2KLO/Mw1WnB
	 BRi+2zmdN3nISajtAvhzZWXFGzevXxH1w5pvnqU8hK077djKGwDSqI6e6A18C1R5QhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462330;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bl3tukg7lSxKTZnMonfg900tTKao55hWsKetg9HhTTc=;
	b=eMvuhL8ybX4SGTE2yiiKKCZOdAi2A3z/k6R+YCwx9oCoYvOtzNu6vnY1nJtSEg1nmNfa
	 2UEZmS0bNiBNBxuOioqCLvHNjTXYPfPM0MRBDNcIdyUUcnjk7uF6PYAWFTcEXbostVB+e
	 V7x57eeO0LGdBmRJWGB56zYdzJFJ3nkumhuiHmgJy2VYvD7f9As7mIxgz4qQaLGGtAJFk
	 9/SQtO7y2bBTtgaZ5tRHdIL+vhBHE1ysvQ1sve+KmULL65sD60yuUmVnemz+n0zXYkXc1
	 QmTGLsYSUWYMPC8myYZXOO6mg5nmyRqpIm0+xfkdRQKZDR6qef0ukwSbNi0ag2fgYFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BncCGsEb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AlAHa4lI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4219B606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4219B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BncCGsEb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AlAHa4lI
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGnCs1861248
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bl3tukg7lSxKTZnMonfg900t
	TKao55hWsKetg9HhTTc=; b=BncCGsEb5ImP/xnUL/M5IBFLqrCp0EtHysgc5K9A
	lCIUpWDrK5QLyhzj5VZhIX4lNQGFkDcUcO6Q69Atu7sNKGBKChv7hJAuXa4ky86U
	n3OmFyy6dZKrQ7RtmpMyWpW9+pegGJmcU9TkVn8EteqoBTru97TQHY98MOpyC6RC
	+wzaGmsC6kaBbUdcxDVWjAQHkHHLhMNxvmVH1AvaWOUw1gEAB7zurQ3fdwRjy2lT
	yy5jEG5d1u00EMxmEIuZWlNZxubCfg0Hk5MmkCJJobJB9Ppm7zB+ncHfi4y/eQut
	skCoI4rnJI+d0ptPHNyaXOFB2ccvDEsabWx1sw2LDZf4Sg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a333s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:32:09 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-869553205a7so50773787b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462328; x=1796067128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bl3tukg7lSxKTZnMonfg900tTKao55hWsKetg9HhTTc=;
        b=AlAHa4lI197rewfdmAU9Fu2VRFsc5WnQq8bPril6T4EZcTO0vcygI+or8IRhAzlBPM
         C4Ti1XoStB8r6Lir4o4PmZO/fnOPmAMQ92L9QQt3xtcUH8z62q+NMZnHwTO14szWavlp
         TtIiRsdBoMAtN/B1s42422YiV//XKjmPVKpoe+h6onY7OAvL5MKQ0AUfe8bs/BAwrNwi
         yMu5x6Q3Al1mfGwbdc3+qbjCtfg2j3K2akcwdjBgoY0gWSfHnRLdCK2YzqEbFEZJFusE
         Q8ZLApFev1vBGIT0T1czuEefc9eEWwLZCTxTLC5SdtqRO59kUMbTSy6kyvDA39z/sdm9
         Zd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462328; x=1796067128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bl3tukg7lSxKTZnMonfg900tTKao55hWsKetg9HhTTc=;
        b=Qf+FWpIUIA79cDVeV1HeLsIpeRWJZe+FcmzdIGTNIhGBgk38rOdLqTW9aLGUC5fPci
         MHy2mxsZ+uefKkc5H8ASmfMjVYjfz6HYOhGnEVJhM1Rd0BI+5cCuapcAuXB+ggwWDEVX
         yBMmd2sHBunYflDCHaVa5dQ955x2e2Q+iJd1ZaI5BcuWawxZtLyROzLHVY64r/d+S+qt
         ARVTa/TQz998RuKYVeTot0reuN697IgdT+MyMhrDWGbVm9IyqbF6gQWtf+ta5R3HIa4l
         8idb6MShV2TqgQTQB4CUgj5qtHWkBGNhd6gy1B71w43FZaeZ5GByF5ud3RLjyA4pEfsu
         L3ug==
X-Forwarded-Encrypted: i=1; AL+hErGC86g57sTrutdeCdIBix8iTq5/ZsqWiXThiQcqCiz616gCP8RINjGSBTCaRh3IVbn+9W5giCHTUy016m56@vger.kernel.org
X-Gm-Message-State: APuU4Z+kHEEIUhtj5HlGboHyMbXGwm1nZS28mXnRHebo9uHFmJFCMJCL
	lI+HkLBdo2A3clFXcz6Zh06JFxCFClLnBBnPO3ef8a/8e9cvW/H1Sh9mT2o0kWVaItXiRzjFVSn
	26VPCxKQVT5zgyfbGUdVx5bHrf9Det/0gRoSyZ4RGc0Ht0UutBPbDzQIUG8UtvXiUOBlV
X-Gm-Gg: AZFdTZebP5/5jt+2lMfm3KRM858d2s9y10o9rMcr62qmGsZu4TRMrUMbKiSmZix9sGW
	ROVfxLgmnKqYgGA1iO+nMcEfsWOqNnLssQMT7dUvFK/JpChk/eGDAzCMo8q1Ji3S95MH/F82G7T
	KaHabomzjUA148pnGURPR9dTHzdqeowP5Wyylq9HLbudfX1SvxYYgChdK6J7sDksWPv2FzQ5uTM
	60XMgaoDfp7K8+awOknjGw1pVQMNqxIkke6u0uM0zoxuSIOczxIaeB9ITFRNePRPaIGsaybWiXm
	7mIm03BhvJOrCvmqX9gx62TQMo4JfGWRHASEi0N+WVFOeSLn3hPlyU2U+nG19z6ub6tUIY6K5LY
	kc8tKudmAM6cm2k6e8j6WxitvW8HI5lO+Ud3D39H1/OFb8oKEWsKUA42qu2unIa7p
X-Received: by 2002:a05:690c:797:b0:8ae:87e7:9ab8 with SMTP id 00721157ae682-8b5205437abmr49285627b3.67.1795462328235;
        Mon, 23 Nov 2026 11:32:08 -0800 (PST)
X-Received: by 2002:a05:690c:797:b0:8ae:87e7:9ab8 with SMTP id 00721157ae682-8b5205437abmr49285267b3.67.1795462327475;
        Mon, 23 Nov 2026 11:32:07 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm23674711f8f.42.2026.11.23.11.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:32:06 -0800 (PST)
Date: Mon, 23 Nov 2026 21:32:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: maili: Add memory-region for audio PD
Message-ID: <icafgm7n43hl7nyvi62drnkcdedoguwcme64cagt4e35w5a3hd@ygpjrig3b5hz>
References: <20261123-maili-audio-v1-1-7dc0152eb70f@oss.qualcomm.com>
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
In-Reply-To: <20261123-maili-audio-v1-1-7dc0152eb70f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX7xcRNfwAo2+c
 3XDFVDbH4W2Z3GVqET/vnGmu3zWfMKuLSZMgng/Bpc2fKZHEn7Wj23HqtbV3S2l9ob/fuq2jlMO
 kEnnysQpm1huM68Z5pt5CAIsTjffgEk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX5PMKhDhmwKEF
 oVR9QcckL/Q7J9wiGW6aXDUvIWX2O4nFtbJ/wxTTra768UtYQdaaH5qg8oI8n2DJsJfa3D8w9CN
 5CV2JSrPbPU7ATlHOGdSxjMQ1M1tHN1XQPLZcbT/LoxqnU1Yo8OkF/uc3EeRWqcJs62m56WTu5d
 qvZvORel6bAfQqnfniNmLhn6lmULiiUONp3eYVgLU1fujKVHFwcbKwCKww9hx9h20C25AP9JlFg
 OFPEi+S9wfjIhQXiXBl58AtZQZIHNZHDLp3x+CQbSHaUofADS7dS5wR47+F2LV0zfln6pweTa3Q
 uouncW3V7CnhAu1Hbp3fqYACQLWy99Ks6FT/jbsiXpxT+kUTStHH/5SfydcmfstP34WEC/z78hG
 44mpFmXVrG8zbsTxDYEqTzy7UirGgkIxaaqNapch/DTFLyRxEdqcpvJ95QvN+y7AnCNg41xxJ9a
 U2MUfxoIUOfKtB/VvbA==
X-Proofpoint-ORIG-GUID: o6B0n8KFvh9_NDxDPG9RltoNiSap_qv6
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b0494b9 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=u-a0JlRQecB2z73C0TQA:9 a=CjuIK1q_8ugA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: o6B0n8KFvh9_NDxDPG9RltoNiSap_qv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230077

On 26-11-23 11:13:36, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
