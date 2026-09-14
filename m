Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710FC3EC829
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371804; cv=none; b=L5yy8mctoN8b6CYp87zjsNXBBB4h3JfvHYnQAooJ6EnqquR8hMkfbgBxrW3DKmyt48d/DEEuzN3A6mvdqfR6O6LJvNyHX59bS3HRssTX9Q9a8fMs6lxxoUnldrIqfQsBqeoQqA6Q2CBxsidR1/dJeGCrf+zyd4PUCHLHdh8ZvMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371804; c=relaxed/simple;
	bh=fqcikxls2+dbYxGrqjqG3drtGjgGan88xU0Jb+QS78s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiHVmtpiyVC8kbTKljpOQQh5wo5J81uIRl1aWKCK7TaR5G4LmRU78yCvtU9fdEkvBaWsTmdVjOFhddmD8h+qddL77tGgQFGZjiouHXRrWE1PebbUOh5FnRsOkEPFSXAdy0I4Tggzt+BSBuz5/XgfG4ulDAFpVKWrX0f6OMBJRAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/32VMLB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=id1NlDha; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/32VMLB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="id1NlDha"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j6PK3197015
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y069kMI3LMPmd4YhgjfkMBHC
	y3CzJVOShN20mUkcnTs=; b=n/32VMLB1DpCAwk/jtEaVx9KoaWPZpgaMOOm/iBv
	KodGppiwQFbRs0gbkyluJZC4YIMIz3J8FSVpz6jS/fRrWgnvvOnQET33WiNncay7
	dEfG9wHQ02jHNayWvyfVV3K0yZlndiuSt35EE08d6Kd/kvvNMgYtNLhP8uf6Qk50
	+biodU8ivl6oaKTsu0pwKIjh8b9Ce8LS8RkVX1gGc/d3zuXQzqpRqSEjfsQ9xIq2
	oRXexBe9NFVyEaMbMELywyQ30g7x34Q07xXfm4iDQV0dmeQKmet51eb0KlmCJJc3
	bqdyhdhurpKyws38JroJ933OpzgfMDmPGE6mszUUFynaiw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cdj2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:43:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a082c014aso394820685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371801; x=1789976601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y069kMI3LMPmd4YhgjfkMBHCy3CzJVOShN20mUkcnTs=;
        b=id1NlDhazAyYQbV639WDIuWAH2V4PWnvwvfOKKDPUiihKEZgESqJBUCiM4hQywSWj7
         6S7wpz1SI6wPYO/FpJmJMA5YSarLF9dpbmXiTStJ1iZ9F8UNjGgdqYNmgmJvnZhpgk6f
         5yv3D6KdB1WAwG1E1bak4AF+qse+UJcjrLl9PzWWpQ4tZZ/H5wmPyupJDzogw6diqryy
         kh/n1CMldxygx2yg9RclFUhPsEgBbQVb2GU2E9d9UL++LIGKHfI1tRNNJk2JilMEmGxj
         Rx2iOdsRsL77R1QyyjBfJjkOasgNSYR8lLkDyT3M5+ZIsUmF9ff3GjbyY4BofTZJcOWx
         MBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371801; x=1789976601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y069kMI3LMPmd4YhgjfkMBHCy3CzJVOShN20mUkcnTs=;
        b=Z+1x8c0DeP202B0y+bmzVv+lhBlc5GeFZcrQbkbWa7rkBv+orI93LUIk6GAzkCzbmJ
         EnFLoDRZ3GwygO2S/h2sidK5lKUdm8hfGz/PwlPIFi7ck9ARMQvFvRxGDAgs3VuDAJ9g
         A6Ub7Z+zqZaooZjtuYgkV0oUHL7NZgsACjqJURM0MGLpWUT8T8oWbdVN4hngmx+YRL7Z
         ETHtm7yw1PptvY7sJ5aGXn++7+D3gI75RsazQnadQ4AtN1PETfDumMz/iGYwUzcKJUUJ
         WKT08xXFSN2vnGMEwpYdO5gvH9CxQtjjclpT2jysoRc9/HjclE72/5DwNR/BVSnWsabj
         Ch8w==
X-Forwarded-Encrypted: i=1; AKwUvBxiF3KXvUsDMPpbP7SHAfIS0CAy+pzvmq1YsJFG8rLVss75PnYiruNYJWy7tZCcLyKS2cgq/jgaM6Jc/a1M@vger.kernel.org
X-Gm-Message-State: AFuF++nnrlJKc8nMBmAI7uKN98PnOMpZLPm21SBiuKoE8upo8a88c+Zr
	kghlVAyr9ij7H8RwgmoZavPDkjCBTRLLlLBdqgFWCmPMa5ykwUhRdnesihxW4gRWLe1W/pkAbZr
	9EAasHIEUmu30VRxGUeuazAjSYUTbvgqm+Ik6Y6542GxJ1gfUIqjCFXmNRYU+s+O08AjN
X-Gm-Gg: AYBFou09MXHOl579YNLplLyrJyrYXD25OYh4VQXlvVUV0pI5TgWUKZlVAvrrcx24N3K
	DPcBEpnlfC2yGYgPoFF9UdWDIcDATjuwxiCly/+jOG/XO327PBOVNsN7CQlPnXoWN9rTLLKASqA
	5AZzl8s2pZfx9yPDRk6mEYqnjEzF95QVt5Odmw1I56om6QDetSZ9GY/eyqu5H8hqN5+fEesTuzd
	LgaCxchcPsbGWI6dnNzmX+9x9w1hVCdeiBj/Zhd+AJrb8XXiP9zcdCNiJ1hZhsa0Dl9BYuYAxEj
	qq642ryD0yeBg+lvRcudH2VliuZSfvEP4BoS86m4zAddy3kmbYrH5OeBUINcE3V8eVNf5o71Y/K
	1heKq38joQLpr2g==
X-Received: by 2002:a05:620a:488d:b0:939:72cb:baf3 with SMTP id af79cd13be357-93a187ba1bbmr501246485a.42.1789371800614;
        Mon, 14 Sep 2026 00:43:20 -0700 (PDT)
X-Received: by 2002:a05:620a:488d:b0:939:72cb:baf3 with SMTP id af79cd13be357-93a187ba1bbmr501244285a.42.1789371800073;
        Mon, 14 Sep 2026 00:43:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e4b5sm24639722f8f.22.2026.09.14.00.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:43:19 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:43:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 29/31] arm64: dts: qcom: sm4450: Add domain idle state
 names
Message-ID: <nm7ds3j53rtcwdviye7mt4cirkpsw4deoiopah5fvqd45nrqg3@vvosfg3wn6ii>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-29-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-29-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: WPuRs_HjIzmpn--YyCVuQfs2Bkwbw8MB
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa7a599 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX9AZDWPjw/SoS
 3VZERA8v2PESaRYk0g0s13329gyWXorI9ARNCqhJi4sAyq3vE6aks7KSUrcjDE0gOnh+ciM6nQT
 bK79iLFz8TBGkPWc8ROMDWDXk8Bbx6Y=
X-Proofpoint-ORIG-GUID: WPuRs_HjIzmpn--YyCVuQfs2Bkwbw8MB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX6IQ8CZXuMRoV
 w6QVEwzoEb0+fWy0+Y7qcRELlIm8NPeyzikQfgWb/l6H8z56RiFsbPCzK5LnjQqcM7mWzl4OzjT
 lZzEcQRLF2tgWZnPf5L8uJZkN9+nPSsRhHUZ86U0UnLFABsyd1GGcDFIS1X0f0yq7LLFtrdT6du
 7pSfxeSckndDKzSzlmTobumPzlz8aWPE5+IvSLEXXf7z0xam26mdPncA3f1xe50j/dEf+w53ACi
 qcd1J/Vnjx+51+k19DH+44ZvNHjLPwNnwnakT/vSPunnvHbQ80feKJZdUnQBXEjeST+epQ6k7j5
 eButasefGBn9/vJuFno7itAjMjsa1vlzLrMflin7W+2GrjAFZJKzjUqAupoUe/KkIRXU2QUmC0Q
 J/BW4P2n0sJX+esT5sZEw6ZQIdwgMzrXGsd2Jv2elWPbRKVduIlCoQvs1cmkdiBU70lT2N3B0A5
 2nq9KrFx3GEa+giidTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:30:01, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
