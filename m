Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303177;
	b=BvkDc5NmPInGMt7VBQz8It//Ls6q+rfiFfxNciIpBJ4wq1H6sVFQicYro3Yg0yKVqh8z
	 Wwsk4ny7gps3A2kCsyuVnkmGp7wGKlULnD7whojxlO3v3Rf5wHg1GSJ4U6+bx8JqP7VdN
	 qSyv+is4znPEWx7mIR/9gJ6Gv3YqVHWF+js7m7UgUYtOXaU4Ltt9j86TVSa13wHafQ4l/
	 FhfZoXE/JER8IXrTpwlfHbrlaHQn/VDItqpsd1DaDf0A+tA6aRyRUi22bUF4ydkqNFua2
	 e2ELMtFzeq5NSAiAxsJQuBogheqWyPQjhbf8kgfJUNU4VbtRyKeXHXuG5PoE5Ee0Fzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AIwdvfv8rFnWmQAXW0+2gaUQ37WcaFzgr/rRJaHU/2g=;
	b=ikQvAwSZxFhooqNYeD8zZzByMlDL1IPBFhHlkyeIL4ivBnIVC/eNQwSbpmWRoRUE3C0x
	 G5NJCQOkZqLyFyJs7py3/siflM5DIz+teFwD3FwIl9Tpuij0S1eXwffp2l21/FeIdLU8z
	 vdM//PyoEc4EKvd14siTp6LblNFn5W+JOG/eV9PCl0pmHOwvE+sVLuJ7XQZr+7WEgHgnI
	 jK7wk8pUJAvtvAg63W+K4F5S5QtAvLyjpqXwvrqxEHT79nlj5n63IET/KfuvoSwJwgD7d
	 alQUGK0D8pjZJe9XgcHh5v9CVUnspyyGBD6/ECAB99RNSfT/vpPa8t02iZ+LjEwiC5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocvGGT34;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QP2/DHDT";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D0C606C666
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D0C606C666
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocvGGT34;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QP2/DHDT
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lGw62240852
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AIwdvfv8rFnWmQAXW0+2gaUQ
	37WcaFzgr/rRJaHU/2g=; b=ocvGGT34bn4M4P/HbamvVoCfqY7boa9w9lNhDKJ9
	54A4Dbex1DfOFeIavx/5e/bw7YDfuzfvGoUSuO9EHg5jiFQA4bQ/8tx4QDp/YimO
	fDi1e+65kHQkyYO/yGKepEJSAkfmmveiBIdrAui0fFqk0Di0+qi2IyjLG8cjWyzb
	wLYKfC942YOPUVv/4S55K/Hw/AFv65GDAdhQ4GrU/GaLimfbrXPK3T7rh4y5ENGf
	+RRgPI8Rn+9Ooz2QoJoaeo9H37O54uNVpT9Pl8y3eXQLLxl8hN34do/BO4Jw2VVe
	PAfG6iETnEcDepIahtJovPXFPV3lEOhR/Uo0N5a5yX+eJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp1bj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:32:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf6c528aso328648885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794303175; x=1794907975; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AIwdvfv8rFnWmQAXW0+2gaUQ37WcaFzgr/rRJaHU/2g=;
        b=QP2/DHDTYacyWTjYhaPQQc0EfWB0xG0UlhRUyi4agR+VmrAaWgrwV7DPmiYhu7kUBD
         9LJQ1OhFpdeAST7wCBguUogFxKbpYLXtBrNvI+x0dB06YFx32vcj9bsz3SZ5pqPlxiRl
         HU5I6/LbqoEll8gPMJncL6b+uuUiYOiNFSEW8dRUFVgl1wZ8GX5HP9c4eHXyS4MqaWio
         WUMhVlbZ7nVDbRD7IMn1vO+xlkuXbyXzl9/xrYOa7TdzgKx4zuhYD9LFMbbXdYZeNY1P
         VkcTrdoJL/fAzLb8lcZe149tcqKiF7CneX2qauck5wrtM0RQlFgy3TJhui3L8hdsDOF3
         CAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303175; x=1794907975;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AIwdvfv8rFnWmQAXW0+2gaUQ37WcaFzgr/rRJaHU/2g=;
        b=lBI2DhcO4R3FznJYvtPIB46eYMLhJOPB/bAzvKtUaYVMo778djfhe1nJ5RmH8m0udA
         JFJfciNvCzCy7BkCIO5Rf1tRF4IckuwcU3uchQiujCsYjzl6H/EH2WmswOPmWi9cDAv/
         Qcc5X9dJg9MPSXcDm4jMA/2CERKdjHU77pESCSJlTngPU1st/2NtcICGvC0k629wSCXM
         S5oEIHDQFZ3j0hJ4c87SGX6nHUVpSwXnDwI5oo+RGdNSHyg0PSHAHtl/Z3cQsw4asJpS
         4kmhyBAWcNuwHg1dTGlwQW3cXEsDlTAMvflVpA/+P2ASRg6JgDt3dlFQh3cl+cdYYc3A
         buZg==
X-Forwarded-Encrypted: i=1; AL+hErGbZlOS+I4Aqw8tpw2UorOqUQ10lEMAbIuTGnw6+0xEtrMPR7N3FHQYek78KPd34m4DE71WL3tPZ4G0kG/L@vger.kernel.org
X-Gm-Message-State: APuU4Z/7vqk3BjELEwEPxJqf9rIrtigkWINbXVmeHqCO17e8zlB6yKrj
	3pio12lMTCmNjd9ip5kTCNWOxWDFLVy4EEoeyC1wgKQMvhe3KMw0aYJyKhVDZAltkVolSwSTpeB
	hf0Cec9x3qD74xi8X3bfCduZw9JOtJH8hQZUJc2Zf+lv349R+yLIp7iXUUZh/yYPXCloU
X-Gm-Gg: AYBFou0qvUuYfckLrZ9cdeOTK3333URt/tunNNgS9wVUMldjYLh2Yr88j3efYyCrpf8
	Mcpb3BA3iefATET3akUNU5P7gY26ZmTgUILMaYi+buI1dMLXB8ys+FGLfkQT3KFSNnFn0fC7km4
	GrNEnqzeT672Phgq76FkJ4WIhm3EJ+0XyqazbTp4YsxJH4yo41zXqEJ0a9Z1yH/YrgaBRo+Bqob
	Vi5mamQv5O4Iln42lphEP0eBe79JXhwhqD30oQTCvtpqMaNI00qS8URwdwRaQvITQ2DI9XCQKxH
	XKQlXJ/BywDykSRcmH616PQrGwhpnhN4ZyQhDIUUAOm+IxDNQ0HEuxPqNcagRiihstVn1S/P7iH
	9Nsw6hiCnqrbFYSgzKRJySFMiM0VmXRPjqTvEMOK/N++YFGyUGygRr+PY1yi0WLss
X-Received: by 2002:a05:620a:4546:b0:93f:24e6:403e with SMTP id af79cd13be357-9479f38fd92mr310072585a.54.1794303174999;
        Tue, 10 Nov 2026 01:32:54 -0800 (PST)
X-Received: by 2002:a05:620a:4546:b0:93f:24e6:403e with SMTP id af79cd13be357-9479f38fd92mr310070385a.54.1794303174440;
        Tue, 10 Nov 2026 01:32:54 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2bf91sm4018684f8f.23.2026.11.10.01.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:32:53 -0800 (PST)
Date: Tue, 10 Nov 2026 11:32:51 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] soc: qcom: socinfo: Add missing PMIC identifiers
Message-ID: <vzx4mrnkwpoimp62ztwjrgud46zxiwzho4mqqvzbpusj3cbk6s@m653kpegiigz>
References: <20261110-topic-socinfo_pmics-v2-1-14811aa728c2@oss.qualcomm.com>
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
In-Reply-To: <20261110-topic-socinfo_pmics-v2-1-14811aa728c2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: b09ubuK8StCn-UHMtkSVaT5vTFaFZ4jw
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af2e4c8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Angy_Qz50ieVqVq4d4cA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX/h4p5IMMHhjl
 bgkzbMnjPYl2CzXEyVtFTFJ7ikG+cIx6LPsLRvbwBbKjJVms+6J9LeVQmq7YOZyDghctWrkqKEp
 TE6sQejCJh3SkJrGDAe3M/gkbnTWg73pVCYzzmBvciq27HALoKQ3qeKPwyCfNPD4gIcvx8c6A6f
 Nxl1F3/T9ekCvoCDR+Ou4gD9v637/02LI722XSpAjnuhIuFvbg2qQesz/dJZH7I1P+vl87OZ529
 rbJwdEgubjDlKJACXx4hABkQu7oOUhtkecCl9IFm2GbRQtUuiRRAG3P8YcR1i44rMDf4gOv52kB
 16Xgv/I6qyLGsusooxk0S9gLNbKOF3McnEj84ZQ4gFPYTzD4fFTo0YjhY8inL2+DlZLSWJmT9ko
 oXGhBt0s2ua9XAc4U8DR57Os6TIgJdY8hgphojfGyd2KkLCVVUPPNWuVo8u+2GVWXtQElpDHwOM
 54P4l/ZXPkln8Isp1aQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX5BEuFZhj1HlH
 GOdvT2uKHaVd35o32ygiZYbelf3lebqWh2sy82PTX/hVRSnzJZ7BCN67j+XTX3gs4+VW/dVhBFd
 ecfPxaK+6HMDQc27UblptXwHCobte2A=
X-Proofpoint-GUID: b09ubuK8StCn-UHMtkSVaT5vTFaFZ4jw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100037

On 26-11-10 08:58:17, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Many indices within pmic_models[] were skipped. Fill out the ones I was
> able to confirm and leave comments for values which to the best of my
> knowledge are reserved.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Nice.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
