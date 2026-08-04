Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BD8455164
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848894; cv=none; b=dKdpG70Fhn4fzOvTYsYxTfUow75/11jRhV1yiGNHQf97UBnhT2JKvdW428pbss5wec+mR5U3XVKWWNmvneB2cRZ/m2I7ruvEdekkG2SWGwN1Hh01Z9k8xqdhXbqr9bc0gLTPzx2/nY4X6iHVo2x47NxUdBM7vFH6FpLhJvXy81Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848894; c=relaxed/simple;
	bh=PlD2NIDIZwT9DejzNIGPChPrCBxCUm38ftQ7OBH8g44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqlf90J1veJcz/1/IxSp58oMAjEs4chvfmU0zxsGGx7FUlICanEj1HN4y11xVQV0p9irzkxp2Q2sHPxjZvhovOaQxVnlvaQ8sFdKfdec+oonj9cKglXxqQnLR4cU7ewF3z0MQadXt1iFPFxPRYaWzd9CRtyslzC8pJwhB38ZznA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ivKeJqaR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/fbwfcS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ivKeJqaR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/fbwfcS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CXV794144202
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 13:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=10XOnDn3aTYFPye/g/keLeps
	r+kMiNC63RozS31gDI4=; b=ivKeJqaR3PxidchUlY99QMofuv19ILM9BiZX+aRp
	n8kX2VdyPPj4WMexM9T9GJI02rQb1bIVd0m+30t5iCBFdNW/NfxApEWD+eczpe5F
	guenZQTFHGmlWfGrvcE5YLLjiGo3ylHvZxv71edeVTdof3+IYHWPWPzDiGlX+QMo
	q8ibet7lunY8/VqCN4bQgEfvZSpElJWg/4NH6kvL91Gt2iuN/uBSXlcmTl1SLKMZ
	Fbx7sMQIqXbz8/3bi8qxol5BjT9nFlKx3z9CUtsFlnozgUf9VQCe9RQ/BQjZDSkT
	snbAnInkbWQRHXHqoldXs1OcNSgmx446CzmWCp3rvUmZlA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu3vs32x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 13:08:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a9764f0so47740711cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 06:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785848891; x=1786453691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=10XOnDn3aTYFPye/g/keLepsr+kMiNC63RozS31gDI4=;
        b=d/fbwfcS0dPbE+khzJDtKUygPjBF5u93iXE3zgbKjLncggOz/QWEuNmSjbUgAAHCMu
         1qZLJTDgwvqEkntQWjV4Htn4Sgfa7yKkjZ5OKIL/K+zx15yk2Ksy4JPUNMXifmy36Ju5
         odyqCj3KpIXZsCtSOsgRsjprY7/Scf+Bobp19DJf70LFZHGR1dknvDGO+l3gPgrFyneQ
         D6RaJ5cqksqnoxfpw2TEqyO/6maYe8LLDLTwqXizHoVRQhLryhhxcA5T+pNbTBJX/23O
         ecHvGywj+JWjzVnSGbSrUnb5N2dr/KlzyJzuyMs1hlRWmis/1D4sc+Yigl5y69DBkeWo
         ZQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785848891; x=1786453691;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10XOnDn3aTYFPye/g/keLepsr+kMiNC63RozS31gDI4=;
        b=B0h+4z3LSPsFhwmkr5Sq1stcRtoDlGsl6ycA+Wm44se5e++nA2HeSe15nIXJCs/VN8
         +sTbCj6m7ROPHFmPNT9CTAERxSfBEmunfHYuK9PQBEJbnUowIjON1NMfc0/ieKWhdCNs
         nftqobRJxNLAt6TiIGt9wtrOoJOqz7q+gNdpIMYmoR//nlOBdVBBJfdozGzZa2/NGxdg
         iCi26D0s406XQfpIs+1I1LHV5TRquCUYP9ff6vV7J2AU8J4Q602N0TiuQBd474wDO1S1
         ImWgDnL6zOil38hOY6pndKMUJ6gUpFQFRZKC+vd3G4/RsNlnVOiVBi44r8ijWh8lXaAP
         0yGw==
X-Forwarded-Encrypted: i=1; AHgh+Rq2P4ghfIkkrlehk6HhLvup3T9t3mM9RLJ+ws9TmgEKAP506kBaU+RnbgokZB2hWRuFv5Qybg3ArMTFpcJ1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+5NDRtz/PjMXL83W8wxPsMh3TxIX0qoKBBdbLhBc+/CKIRG+3
	nXu71kzY/fS8jkBqadEqOfeEkF9v3rDhmgqfxQJa+e75kskFj+eBFsgo6nbZ0EZbZIuVf0sxBVv
	fkzQE5J7tfN8YlitdPL2UKeMy99s5wHz9XM2u+Zo2ItPnQjWD7VojdfyKQkB67qv4Afpj
X-Gm-Gg: AR+sD1319SOaahBXgmv0GchdnXx3yVyEy8DA2w4BydekmgEc+UYaT6oTwWrMmWxHwIf
	JBHMEHdts1OgEGNl7rDZNTE8eJTMwF0M2+Dgjg/CQAUyXl0QimDndYtFWyezOWiIgHsD2xOtrd6
	Q1l6xU9sDG8EvwOHfUuTIxams2/NfppNK+ONlUdEjzuSBOEfqbpkn1zMiuTMH9CAHnZVQgOckMf
	VDyT/YxH8rz6rQNdq9HfUmT6wqQCLLKuYS6GRc+9mfe4fJEOzZAxIoMA1Q34wCHM7tEfAavXN1P
	YrtBo0P6uDjUddse9IdHbkqAv/bVOuPx/ObewZ+tUb0pyh0H3TWSAY2pQrxYKbRkcnXa9l/S+BU
	XRbWPSCQIWWSJwg==
X-Received: by 2002:a05:622a:4d0f:b0:51a:ee21:d342 with SMTP id d75a77b69052e-52b567522acmr314122651cf.20.1785848890641;
        Tue, 04 Aug 2026 06:08:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4d0f:b0:51a:ee21:d342 with SMTP id d75a77b69052e-52b567522acmr314121601cf.20.1785848890031;
        Tue, 04 Aug 2026 06:08:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b23f6fsm281086695e9.0.2026.08.04.06.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:08:09 -0700 (PDT)
Date: Tue, 4 Aug 2026 16:08:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] clk: qcom: nwgcc-nord: Add video axi clock resets
 for Nord
Message-ID: <7k3quzrdkhi7r6fs2hn4mfr4wtkxmbejwa2ev3nknlc3k5wifk@yicurkulkqsg>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
 <20260801-nord_videocc_camcc-v2-2-674d7718e41f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-nord_videocc_camcc-v2-2-674d7718e41f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEwNSBTYWx0ZWRfX4fGmXNjCTbbR
 Bt422fhSICmzgJOvjLkEQryzBflZbYtSrERSRHApQyvAPnB3VsilWvW3nuykXTc30tlUgTcEEcJ
 +Grs/oGWIRmYrZFfhh7/fsrLDjtcyL+pb79UJQJsaWVxhFCYczXaZggUwkClNiHl4ZE2XcaRlVe
 d3uw9d7Cpj5a7E9OMEIh9RIlO6s0LQCvU6qp/+8btKot4fTsUkgYxjAWrcqT/iftlwaJI95Sh9p
 svWPCTRwVzYkUsyRAxnJe8LTXhzAPxOw7+WuCGNVip/wxuB+HUeevtwfDNpDOIB+vD85EwroVVZ
 4zp5BmyBp7842h5EJ6tKmQKuWhnRIqvMtCtNPl/ZouK5AZKhRA3x2tk9fybDzTj/VPGN/G4szGJ
 G4G6uYhWbcMDlFFlmgow6qjZUW/k6K2xOKfpy6TWoxfeDt8ZuSFQQyk4lyCSGmU3atgsC7Z0ZtK
 XqIYqPiV9esIeXekS2A==
X-Proofpoint-ORIG-GUID: aAh-QxwS7fJPG74WfSTzvSGaCElZWfAW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEwNSBTYWx0ZWRfXxcvf5mAOPFyd
 xRvucFix4jwV1vZzqZPAGLHv/fYSmIBfFJ9r+x+ulKa0o+/tNLuh6e9Ql55dFB5Pyq1eWEkcyfb
 fJsoNjnz5cavrGooaNxxeNxSy7y8BA8=
X-Authority-Analysis: v=2.4 cv=EK82FVZC c=1 sm=1 tr=0 ts=6a71e43b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-zE5Bsz_LXmV53O_SacA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: aAh-QxwS7fJPG74WfSTzvSGaCElZWfAW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040105

On 26-08-01 19:43:53, Taniya Das wrote:
> The global clock controller video axi reset clocks are required by
> the video SW driver to assert and deassert the clock resets during
> their power down sequence. Hence add these clock resets.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
