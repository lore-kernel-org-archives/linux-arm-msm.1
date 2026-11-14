Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666829;
	b=kDJPXuiySAbnOK21WeIkj0qBo6TusmA0d87RU7UKwvP1SCTIO7cpH0csYg0lN+ZLYzod
	 H9XG9+aoVr4mIHSJEZji+TXQK9Bauh9gNYlqAxUx1Cm1Vr2Ty7bkWM3EGJ2YrrvtV6itx
	 rKLhcUfEwPsWVxXf5CghB4/2K1fDP0xsKujUEm8p9dzTtC6VP3EE7VciLDqjFGQvrstZK
	 YN8kz4JmB8P2R2Y3x01H4UURdfMwjsX+36k2nSv79iSKvAPclN+qwgyZlxRWSbAijKMEn
	 q9rvUVSypV0bzX9n34QuRwcpVqqRXWg5gWAKvn+OgVu4xHcC452lR3pOwQW4IZlk5aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666829;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XelhVseWOPwz4cK878gUhIeM0Pn5vcuJ7TytfawmQ+E=;
	b=wP54sBLNEp69AlfZFq/K9+ptZPRRWBEwXQIvlFnwY6QAQ5qvgXQEk+l/DHG6C5QCFFEl
	 es6/RmGvPg6n4AopBffwk29ZpE7frGemkYRs+RvghrpZpPx82a5cfcArlaKiMWEAdPVAU
	 eSxgrZKbpHZKbfRTVvHBwUBv3eafnYC+sCettnqaOiRUL+vYvEExDU4omR8xo127j4+BA
	 NQWqY8gz/iDevQnGgof85mSDsl18B1xdHdCied9rY1bzNoM5u1fvGdbpgpAqS9mcOp1el
	 B/5z+hfzRzQN28oJPLaI008OS453cxkl4ZuWFZRgX6Lbge6hWJSRBSZXWoULRTEFF+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZLnCZ5gF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HoyzYkXC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBCB606A329
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 14:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FBCB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZLnCZ5gF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HoyzYkXC
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDjshM3173363
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 14:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XelhVseWOPwz4cK878gUhIeM
	0Pn5vcuJ7TytfawmQ+E=; b=ZLnCZ5gFbYxUpWpwvVj/NNjZnWvQTap1jU22OKf5
	dloRiopwOIZa0H0Ug9cSEg5/C9JyyQqZHkEGLQJxl2F1rsnnyaL1fDOpNYSVIb55
	dCZgmG9ncu9LkgWXp6RPCLBY4byu75CfotvNz/JBakfL6ktE5KaDchfl9KtUxcHP
	qxGPFckLqPYU0265+OWevF5DqPLRTJurlBFFoviRNpu/Wvf4wTGB8xaVFQsjLUMM
	JBweGVbuv+3Vm31cuB3WZ9Usdm+6iHbSgcLsaiXj2bCT26fo58pcFlN8pQAkr61t
	RyT8eah7xzE01GnmDcC8FL6ZtVG9VM8NEorXa/0TFj24HA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhgyda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 14:33:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9496ff065bcso27375085a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 06:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794666828; x=1795271628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XelhVseWOPwz4cK878gUhIeM0Pn5vcuJ7TytfawmQ+E=;
        b=HoyzYkXCS47q4ZIjLf7aTpXt/HucpMPZKjiINEjczVIzbpBbqQHN8AWq11WzQZSoAY
         rmoh8YeW/X/D+k8uQ8RLpMOLYAX5AexC+5uK9AX1Yvo9vNNHD/ehUd5UvV5y2UDwOWNb
         zskJNX89hr9ahUuChY8Ku4R4ZZK7OAFVA3kYwDP+n7W++vtl32T0iKh/qjjK/QRAK9x5
         5tnOISCsD0PLKorpsiQxAjO89l6cIkn6lVU9xS6YnthT2LAeaakxHWwAc+6GwTGZn0H7
         mw36tFSRW/ugkZx9/XJ/4F8jORfYYhH/eCfYV/tt3LRKs/3iyXa2nPquHfQMOl+/J5YB
         stKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666828; x=1795271628;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XelhVseWOPwz4cK878gUhIeM0Pn5vcuJ7TytfawmQ+E=;
        b=nVAUBNOyCV/szg94uJg/TqnZIpFBeESKL5F9QXChQPMuE6NijNiMdkgt6QmJaRkV7R
         vhqEH9aj3oPbT4tS9m9UbNV4XEMfFaMluDw1rw6++03ljCZQyPIE7zCYGD8j9hpbkJQz
         w7R/un/RFZ4RUAFVTB+QhH+XTW+BYUSS/0fDEHc6Tt5W2uWdNO77wXvBsUZdXueV/5E5
         rPeroE01SZdbAYwt9jJMloxIRu7eZcQkoTIbFcWWNpW3lcJsKHaAiIygTcATOt9iA6m5
         tya0gpUefQZWXjwsI0jmlcFqTk87/xbW4BjwXJPgcX0RoWeC8HuFNEtzUL8C/mdTIuKl
         Q3sA==
X-Forwarded-Encrypted: i=1; AL+hErEbOyUCI/TI+ssk5lDUKb59x3ipkXDk3Q0Q8EeWhDyxnlS94+g4GgzDipFzn5SFGwysTIURhwz1gYsc5PyS@vger.kernel.org
X-Gm-Message-State: APuU4Z++YH1q4LKA0DB83cPoxhm6uGl7SH1DAVLo/z4rSycS8Xh6IXCK
	KF9erqK4p+GeW0STBySMyKpwLoAMQ0I81glsO4f0XopBT7loPVV1ZFNGqkJ35qPeXx25/WeCxhR
	NdZQpmbvtZ1zc2gSFQeSKt5B9MBfKQcoHvacFFiiaED+4iNrjcJpiZ5QJ8d4iq+ZDa5m5
X-Gm-Gg: AYBFou1301+Mq1iSU7kc1NJw2DP0MUp+6UzDSwN9AFNeX1DanVMwaq1LdpbbI0mCp97
	1v4MZC7mS9uC2k/1/PcPKhMrfy5hc6BjEzOSkV76nFAbFcnEA5Wj/wLDYVTz86Sq56iL3WDS8OG
	9zHMubOpDkB296xKAwKLrLWh/gg6LPqbBbU5jajyfm9adYw1YWOkQ+VXPyGgPmZT036EqO2eVSQ
	Dfl/KWoBbHVJaj/eUAbbG/+eCJErMlKnwJJmghDZKag+XsyL08dX+v1lISEeg3K4q+JplWBqPaJ
	/SKxQLEBORN9aHMR8KcLaJXhzPrasxtV0cIS2g8Fed+GbY/o19tDsvgc3s5SUcGZBjZzHbYzoxc
	JzJjfYXY0GiIa/RYZAsbEdcFXHDhGd2JrlAz4zzb0jtP9PqKw6q/KjrzTT3OiluP6
X-Received: by 2002:a05:620a:ac19:b0:949:5708:3c9c with SMTP id af79cd13be357-94957084b2bmr546881485a.39.1794666827594;
        Sat, 14 Nov 2026 06:33:47 -0800 (PST)
X-Received: by 2002:a05:620a:ac19:b0:949:5708:3c9c with SMTP id af79cd13be357-94957084b2bmr546877185a.39.1794666826943;
        Sat, 14 Nov 2026 06:33:46 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm18652558f8f.7.2026.11.14.06.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:33:46 -0800 (PST)
Date: Sat, 14 Nov 2026 16:33:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: nord: Sort adreno_smmu_0 node by unit
 address
Message-ID: <slowdj62cba3dk27sgb5l6pe7keldx3k4iqvx2wc534gj7kmy7@x4dxbjmdmznh>
References: <20261111034756.3632469-1-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261111034756.3632469-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: kbm3FrqOpUBOmttDWBi2jrkceC6Vh0Iu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1NyBTYWx0ZWRfX7zfpvAOeHspM
 6Fp6Tza+rNCfZt9Jj5Q4zeZ7+qNb3iHphWCzKgiKePC7IlxAjr14kHuol7zQqw9OrTY/fR12Lm8
 xEx5nJiGifcbFpX02v+eDBSLlC13fmE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1NyBTYWx0ZWRfX5TKx8io6EPP4
 PulZbPr7PpvDtjqsMja9jbWVlb0vyYBMEDCZZkMGLtyLZy1AAiztwxecyEKNIGjvsDi6yECUuZj
 XjzPB59TkmXmZ2iizh1Jq0kFgjrMIgG9dJvO74nsXJkzdXIn/LcFFj8B7QrnGhcLucWTqQh6Opw
 qFsZ+wH+4O4QIj3id1CzspOgcQjutzDKRRnTY1Uy/YQ7kKUahZCLItfiCNFeISe/LgijyOwwt1C
 v58ADP9zgvu2xah1wcY410VQleKpU2c9pFQePjWnL+LHmnYlCZ8xKkfp9kG6L5CDDImNELCcrEk
 TuCm0SYgBshiZlKUYJQTc4tPAXDFKl99thzbXMxdU/CZrHzymqeCKmtRc/rKx7pb5dCMIyAtPfv
 nRzSJY3/nQkhf2gfqs19aHkYlG6f1K6CWmQZ/2cDU4z7BYYNwi/1vtCvbajoi3eHEfWFpLd5P8x
 kGxYZQ/l8Ota+LFyghA==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6af8714c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=V6h-8VdV8C8-G1v_c3gA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: kbm3FrqOpUBOmttDWBi2jrkceC6Vh0Iu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140057

On 26-11-11 11:47:56, Shawn Guo wrote:
> The adreno_smmu_0 node at 0x3da0000 was placed after ipcc0 at 0x9007000,
> breaking the unit address ordering of nodes under /soc.
> 
> Move it between syscon@1f60000 and remoteproc@4c00000.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
