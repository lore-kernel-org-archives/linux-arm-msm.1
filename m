Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF213EC689
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 06:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541608; cv=none; b=VqdnVlRtswZSoR6VhGjn0E8s0qd/6zN+ZNTR5fFQ8s5o8oUdW874SPeZHqV6PVCqHYm5Ori3jyZ9MuZ3WT+kuOcjhVyTJIyHw8cqy9EyMyiPgAckX6ZtLAex0kDJLzXDiMSqhgLB6FUTYJejqgGJnXOv96aeC+ycQraCCusYS18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541608; c=relaxed/simple;
	bh=5DxFpF1gDFofnl6UBsgenYdl9OfbiRr3Qm5kQ66cnCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vw/AMR/lPnE11hgqfs/YIttNgl9P9RJxMSz6qylRpcZftG6c3aNpiWJQ/yaW2HfHurtfjqZo0/cPwvLcpjJIDJiU5QaC6YT9MYP+JC1xpH8vWc34zl4wU/vMHKjdwiSSdgv5lQxkSrC6nvHXBxHT1isDl2WlBvqlIukcaSTBs4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NKuRlGq+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OK+Fr0QY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NKuRlGq+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OK+Fr0QY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68feD1730563
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 06:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zdJICY8sChh/Ab9/vkLNvJjS
	4qtItZSpI8UBFTO2yPM=; b=NKuRlGq+Et96K8GcBuAIlqvDrA/l6Sw5NlPgWP00
	tIIMrs9y+cUVjRypr8soXTPvc6018/lRH26x2FMOtjXucMHq1Ak/mBgH1N7Jzgxm
	IFcM11h9D6EOw1NIiOdPE8+TCPXLWYNaOuV6+1KWQQ4PE+EvPHsx/d0ABypeb3FD
	Aqu61yMJa46kULW0DUPMgNMCy7bKRgc8ZQ4h0s95+rmJHemtD1pegLNMeQKaFrWL
	8h8HoNcTWSsD+BHrFNGyRrP5UvJKg4meVdq3PCr5tiF2n1qsnzuanxo3GiE38OP6
	aP+t4Q/3zytiUe1iMPh1gV2Kac5APtI0XGHyHSNoTOtpGQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqkv7gmyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 06:53:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so11649352a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 23:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789541605; x=1790146405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zdJICY8sChh/Ab9/vkLNvJjS4qtItZSpI8UBFTO2yPM=;
        b=OK+Fr0QYLGYsC9/o+jiluQ+6mSlJBpw3TyOEBkFbeDm9WBHi2gp+l+kKRlHBj4CvL/
         nJT4qAowEeRT48O7UIpeWU9yVGNhPMMTXG4gcTp/WBkGpfXy9WPcc8Wj71BYQ991/BgF
         BmRbpknpkHodI6JEkR3SsfjpQK5hTKFcAoiM7d1MaZvAgjTAsHdipFEnG10f/djlxH2O
         tX0vv8mWHIzCVOYuMZUTYwIZ+nMYjEk6h4VJW9AklM2X8k0ZI2p5w8AtfBbw0Ngau7OU
         jjN1UyQ6eHPY8O32M2c7cW+0wHHT8yt6FIlztRi7gVtNEGmv32o0ZvuZW5ZDgH08qVxD
         Av7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541605; x=1790146405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdJICY8sChh/Ab9/vkLNvJjS4qtItZSpI8UBFTO2yPM=;
        b=Y1PDxRIz8LFaBK2/urzq2qBXjP8NQmSNqMbqlwrpoeZu7+DdIUGSGkXgJQqiu2hljF
         XMtTivaFtXHGkFWkwQIBWezIrYZu0GrkUaXCNWh8KTkN6YG3UH5Gy2WvJlqWOM9esMV0
         CMPm3YXvBVBILycNeWvD5qZc2rkEF9c7sFYv/ZCcz9Nme5cBWdhm1b+vOl+220ePOqOQ
         HChpvfCVzVg3nrbUl3VP3yTLVj1CZJ6lhNDExJUIg5kRHhnfpGZ3T+XzDNlNMQoDjGIT
         a9RnvQl1b4CUnWVO6nCa/vJdrEwo3N43a0rdkPlVoU3bcROLA29vUzodqng7TY0PLd8u
         GrDA==
X-Forwarded-Encrypted: i=1; AKwUvBxclchVUJClmKrFI2wnd4neK2fxLuv8oummBGLRBySEm3ia60E5rCFCgHyv1vvfUgTluoof+KNJ1jqoWHZc@vger.kernel.org
X-Gm-Message-State: AFuF++kmse4bsQAuOl2ga+YrhpQvFH9y1GETmRO7vZ9pZSkySR+g0VYj
	sk0BUkopHDKiawj+bywQwBvL2ROrfp6WII+Xvl7dr+/Ka2Pw6BwedAmH2dJHbpMMFwYAZxa/IK4
	+Wu6pDV+vqveCr7yZqykG33rfpCtZ4gkrJVnM/6srXLDTNJsmK30EzkcVeiaj7TBEM0Ck
X-Gm-Gg: AYBFou0KwnLCOrINNekzPOXzXX+E7M/K/r7eN+Py9j++6Hg51qVB4ypZfJKWz0X4Rp6
	u05H0MHhmZwVDMYGQtnUA5MGp4vbXeAsRSa8NQDKeIOKIiFajdfXGHvtF8+EsxefWvHwPQIiK5O
	KnE12gj5B5e3QPDeJ//HP7cNvYe+pzVdbIl/F4rfzfa15Er4w3SVtFhAbNwpxOl2jw0fL67kBj7
	iehKX0Z/hSNekspIduWD9uh0RzWEx58XSs2j9dGGFLtDjRw2Skfb1KQ+Tm9etkc4eJ65J29+w9Q
	U1p7BbK9lrFkTP9ujrFb1dedooeEv7sdi/Qu4aakI4I997zT5ULaDuWN3QOldd09/kNeHDdpbU+
	E+Qmo7zJYmQzJVDXZ6JhF2uemfL3eNLqqe6uNmIDeAr0=
X-Received: by 2002:a17:90b:4c49:b0:39d:fd60:caba with SMTP id 98e67ed59e1d1-39e1e485dddmr3558310a91.14.1789541605176;
        Tue, 15 Sep 2026 23:53:25 -0700 (PDT)
X-Received: by 2002:a17:90b:4c49:b0:39d:fd60:caba with SMTP id 98e67ed59e1d1-39e1e485dddmr3558207a91.14.1789541604110;
        Tue, 15 Sep 2026 23:53:24 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d76834sm4061475c88.14.2026.09.15.23.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:53:23 -0700 (PDT)
Date: Wed, 16 Sep 2026 14:53:18 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: nord: Add gpr node
Message-ID: <aqo83oOYbKjftV2P@QCOM-aGQu4IUr3Y>
References: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
 <20260914024003.120931-2-shengchao.guo@oss.qualcomm.com>
 <376996a2-358e-439f-8461-1981c43df671@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <376996a2-358e-439f-8461-1981c43df671@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gbYApia8oj84zwiLYidciuItlyRvBXVu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA4NyBTYWx0ZWRfXw8ycmvvCJC+j
 dDMYArPTRCwXezfXhtOhGPhiisfEZNRxOZtQ48E6jNoS8Y+q3htX5AFaUcIuvJNK2RlQmlKUJg1
 GtpC8bCHTuqWpuIMKB6i0eiU8oTZLpDSxxyivkv9q0qaFF/LQykvRLgDb5jmrd5Z3htf2OP9LOn
 rAXY0JSoyb2dnE/Ke334M+lrtiSfL2ObjrX9k+s7QfGC98iv5LJ2YEiHyjrPyEkC++S/FY151PG
 YuRL0KhGyiE4peoWmSTZayYEOzQDyOft/lzOXk04OA2oq7q8tzxAbIxCdOidnovgCb/IjhJLNXt
 QKtCXU7/wlqrrxgVS48EDfmyKUUmbYY/w6aUgtrTxmbYjvdNzUTWbZnj4Fn3IJrndcmqSPNBDim
 1MGdZwSEyiDc+IYMxt41GpRE8AI+7jiDIrY1wXpL0Cpnzmb9CftBHGf8HJU/924yiK6WkohhYG0
 saXMRrJDlOOgB1TNjuA==
X-Authority-Analysis: v=2.4 cv=eKmGH3p1 c=1 sm=1 tr=0 ts=6aaa3ce6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IK7rdWjKPlVaZ1U60SUA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA4NyBTYWx0ZWRfX5DsCNUTvrh2m
 eiuwRd3GbCNb/62nzQ98Rek+L59aneeutKUxZD7Ctlubf85zb0KZywEC51UZtRK5E2VXVSBP7BM
 8vr6WHngSbdklh1ROAMtwEIBzgP065M=
X-Proofpoint-GUID: gbYApia8oj84zwiLYidciuItlyRvBXVu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160087

On Mon, Sep 14, 2026 at 11:00:11AM +0200, Konrad Dybcio wrote:
> On 9/14/26 4:40 AM, Shawn Guo wrote:
> > From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> > 
> > Add the GPR (Generic Packet Router) node to the nord SoC DTSI along
> > with the APM (Audio Process Manager) and PRM (Proxy Resource Manager)
> > audio services. These nodes are required by the Q6APM audio stack to
> > route audio packets between the application processor and the DSP.
> 
> [...]
> 
> > +				gpr {
> > +					compatible = "qcom,gpr";
> > +					qcom,glink-channels = "adsp_apps";
> > +					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
> > +					qcom,intents = <512 20>;
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +
> > +					q6apm: service@1 {
> > +						compatible = "qcom,q6apm";
> > +						reg = <GPR_APM_MODULE_IID>;
> > +						#sound-dai-cells = <0>;
> > +
> > +						q6apmbedai: bedais {
> > +							compatible = "qcom,q6apm-lpass-dais";
> > +							#sound-dai-cells = <1>;
> > +						};
> > +
> > +						q6apmdai: dais {
> > +							compatible = "qcom,q6apm-dais";
> > +							iommus = <&apps_smmu_0 0x09E1 0x0400>;
> 
> Please consistently use lowercase hex

Good catch! Will fix.

Shawn
