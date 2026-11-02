Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626525;
	b=fquTr+3bB12wIPOVhRg87/0HxnZazrzPsnn0JdB67X2abuLqxkxsy1lmMZZO1LcX7Ox1
	 +KS7fJJSgoGws8l6XPzIya9i2f88cAwW0nuOjq3+uMrTDLhvLe80+YhcA0OgI1LWNxb2l
	 wYrQZKlRkDQhiW02KwRCny104C1LdHd4t06CGwa9uTCYudF0Usbq+wiyVqnIKfYMvkW9Q
	 X/Xc2sEIP1nP40elkD9llOL1aycXBFet6RQiS7acmNjIJB51EIEwsFy75iyIwJoRqnB3W
	 dkLW+UkdUVx2vlcuM2H1LhGaXGG/JswVsFqicNEvLNJF/MNqq9vhv+SqfXBdXp87GhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XiJjr6MHKIw5QEvJXljJWlEb3Q+VDlJLUff5S8aekMA=;
	b=x9TcChzwhOZ1YhNtw086kbfF7fxW1V4EppJtPW0Zb6whtzEY4W0HG8z4wDTLlc8X3NSe
	 imniOgHQkUzWoWTrn2SNLFkQeQYMuwq2fsQ1G7MrWMeKIsIcDXsLNZdL9i/hX4xIYxk37
	 jakTTXEMigGm2xI+Yat01vd956c+phXE1OSEDnnPD5Q/5P2V20Kn3Su7X7hAQQLY62FAt
	 zftrAwNQLApQBzOwYsDD1UuYfeht5QwaZOOBsjM0PYypBGH5MFIiYcWNRdwwLQqEiziFr
	 McArBTsmv2kFrB9awGqw4bYblOF5wv3QcbbQgOVezelxTeAB1gISs1RKoL6y4i3CpJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KtD+KjNR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c83ex4td;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C23606A329
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53C23606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KtD+KjNR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c83ex4td
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAYH23981977
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XiJjr6MHKIw5QEvJXljJWlEb
	3Q+VDlJLUff5S8aekMA=; b=KtD+KjNRqA2EuR6t+EaQv2KH09GgnbCenwKpagKc
	HgOdpwMeIQdbBCzXfOkn9KQETsMPIq2io646X+bhshL89O1KkbL2p8YzTwhsXR98
	VrBH+YnpNTnqeuofVDXo/+ejOmdw9v/sIQ67TnMs/sQLBHjGygT5os4+MmaP+DLZ
	qAe4nyLwO19s26NhLw6rHAyxXpKP8k8aGgv7YEBRAXWfVezENXhPKSS/kVuFz5Bb
	3TkOGV2WVKPT+OwuvLbw4QKqIfiS+f2HHi0d7kF0fpQEucBZVvvdMAwXE+EA8+94
	Jl9DeYn1vhGgSEUJz7tgXyGsNhzppxIq35Si6dcCpYclMg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5ge2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:35:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f62934ef6so643684885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626523; x=1794231323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XiJjr6MHKIw5QEvJXljJWlEb3Q+VDlJLUff5S8aekMA=;
        b=c83ex4td/bh7JICeUC7hcqsq/LW+0tCNqiqQyyU6ZyxfYb8z52XDuLSA1sGEGcbgtN
         qiEzzGnTfXLOF5+/Mxo65mfF+ahLDiSsGRpAvZc5lKp0bQTxBlHs8MXFuWl/OXX7dO2z
         nSCJ8PtorHj959w9limZyagK41GhUeBBA4fZfPuUsUWhBF0TsgiwA5n7AcS0QZZWLWq5
         3MkcbzHty8vwGmyqUAEfTCA5Bv2uSom2xh5pi745DgCExn5/YppnuBCIM8tsVbq2w4nJ
         lBRJBIx65MkEl37x0yDN6ZBack8ERrubBM7fZKv3zWi69km3o6ie3JyDC9M8PWu4FRGX
         WgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626523; x=1794231323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XiJjr6MHKIw5QEvJXljJWlEb3Q+VDlJLUff5S8aekMA=;
        b=V/325nGZ/ytw0VZE6bzDwOC9gBdP2PPeuTVuIUf14ITixQObM+PtqmwYb1YcFHuXxJ
         hWFw2gEKQ14F/T/wsbSLMdSd/oHIjAgMdELFtzhe8VswJ0aUJ9nefhIZq4h4Xeg2Hsl4
         hKFLBEmDtIG7IZ30QrZ3Hrbq+a2k6t2m+AlrLdmw2sfgp27PfGxUs6b3z4BdJSIQefEc
         pHnftOUA8ul0vxU5U2AQfX8fu17bcpbMt6E68kI8yJJu/xniK2961IAf3Zh7PzZ43tvU
         7ZjOSxzG3wf+FL7usMtJMuedA8oXesT04VSTS+LEJBmx4neSaKpCw/v6c55A1BVES1df
         OHbg==
X-Forwarded-Encrypted: i=1; AKwUvBxVb5YJfsHfIhIUJbJ1mbCSilnE1jwAUOrcUJpsca+zxyfk54Yw2nYPZ9loNkPV3jkckeM5XUMRVeOJ0RIe@vger.kernel.org
X-Gm-Message-State: AFq9FYJj4MKXPkQRWptmHQDbmVE0UaFusNLC1mew67xo1O797H/XEqLw
	yHMPzNX/MaI1aPXrZ5GEWYTQn/PvtMfjgZm4jXgChm4HXr9iI1YZjXyXgXNji766Quud2vNUZHL
	jkJPM/IKChZF/WtiOkofqlX47LuY1sRqohdl5EzzilOfVQTvnLOipErYRLODkbTWZZIWl
X-Gm-Gg: AYBFou2o7zPs/+FTEWxnl0mlIsWGElpjiYofBCzuKV8r66lumK1UKRrZdPUiLDXSAFO
	Y/g1DdImsWvSVPS6VkdcM6TJ9YH/w3d7M/1Gwou6en3IpX/ZbN9/H8t9vn1oAgsMZvCP8mF6WW0
	ggGT+ie4IgG836VvsVkv/ryaIFsr3jihJSRIVoFwtBLuV8mm+BQMc8JAq308qIBUu8Hil+W8hOk
	pBtFD4WPk/N2pCOS8JiLY/A/dDt7DlhhG2KW3J4/dpUYUMtRfoWrrIt+zCdq9b0aV3sX9nPjZFW
	H0JIX4oPw9W+dRN3hezC9p8lxBZKJ+qw+Q6ATgbP3+jgBrxoPIbWRH/IzwcsgNbXPwNq6i3p4IP
	3/bI3gq3U+xucY+US9NE/uJOSy0IQjswev1XQ7Mvm5i3aNdRBkKxo0Lfn4nnXr0g=
X-Received: by 2002:a05:620a:6292:b0:93f:26d6:d70b with SMTP id af79cd13be357-944217108f8mr1545469285a.29.1793626523305;
        Mon, 02 Nov 2026 05:35:23 -0800 (PST)
X-Received: by 2002:a05:620a:6292:b0:93f:26d6:d70b with SMTP id af79cd13be357-944217108f8mr1545463985a.29.1793626522749;
        Mon, 02 Nov 2026 05:35:22 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf0b36853sm259158135e9.0.2026.11.02.05.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:35:21 -0800 (PST)
Date: Mon, 2 Nov 2026 15:35:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: milos-nothing-asteroids: Enable
 UFS
Message-ID: <kf7tlseo2i33u2yewgk7iq6dbgunsgyrta5lolustoopowxmee@vuld3isilsoj>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-2-66a56c537749@pm.me>
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
In-Reply-To: <20261030-asteroids-dts-updates-v2-2-66a56c537749@pm.me>
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae8919c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=STFXn1ACf7ZPQ-DneOQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: BDPeknEr038DpDieVqFauXEhz00yHSIV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfXyXmKFiCFGksu
 rY56VPTZuXhOo15oJKPyjZwjhyZGaA564bjeYaYIUX19rNJqYurMwxxXPJbJg8PjVEKH1JtnFCj
 18P79T851dj4lIFcsz+u54GBFBbonRgJRGbEXs6HcqoHjzVJ5+RIYXAclUQCiYzLuTGNHJBPoHI
 71LH+0GxB/wm/zqIt+pjqpDqJ0Yu1UdLPiJ0qy8zS908/iSD91moWiI+btXDsTjp/iP+BjIpd50
 dexivoL6J9I+vmGKI5jfgutVrkLGp0Fb0Ya59gvo/+Ume9PJ1ZYAuI+xDUhPSXizwF7D+CqN+CQ
 CQ5BUbOj7TwvD4c72qQkcp4ENMnat0TanLddVHiyRm0cqRdO2dFkvE/vF5AzvYBtLeslchpZuwN
 hC9bV65l/ZGiK2PUHXqLNdDhqyOgGCnkosIlYqUl5bIR7MFPzm51nPsCNNy6ukrX7SGy6lSSFNX
 hs1xGY+xwvS00OmWwBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfXyczU4kDzm9CQ
 vCv7TdNtGx+an8ir5z7M+n/SpzYqTDx5mcCb9bBg2Twv6p4rVabhKVw3cOl3SLVuXI3c/ZQa8eg
 iEbbPe3B83CQiAhj91LcqTi5rjDhRPE=
X-Proofpoint-GUID: BDPeknEr038DpDieVqFauXEhz00yHSIV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020054

On 26-10-30 22:41:33, Alexander Koskovich wrote:
> Configure and enable the nodes for UFS, so that we can access the
> internal storage.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
