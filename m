Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A492945FFA3
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 10:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776639; cv=none; b=j9OPl0M92CPx5v0vAYwB3YudkoDhz17ZKWwkdlKluKEeES1uW5Ps8uExF5GNwcz30Yl8qAFq0kFQedEPSW6CyBBzvTxTwvKOtutVzaIqjk8JvqzYL7tmvV4xoayuhEm1IMx9HeDo9uU9p8BbkfBtjUdEeyYKznycyUqdIUoxzEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776639; c=relaxed/simple;
	bh=oS6kmuwgfDj95lMaWeSfrxYSbJkNg5dusu6lI99bMG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VbRXSQMzsz8gNh1hqRcuf3dQFi8rJwbEUik+kNgHNp/rNDAcARTm+9zXb2cR3s2Na4Yk+v386vyyK6hrGRraWvF7jiFr+/8GwjzWu9G7ymakvz+vNYSUwwPxosdjqvtuuQpgLmaJkhhNAjLY0h6//GLHX6Lgh8tmPGtFM6p6Kc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+V+Uc3b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0GrazFn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+V+Uc3b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0GrazFn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879c0XA3618987
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 10:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tJDqJTCqI/57p+zQssr36qnZ
	iecBMtZIMFQgWWk9P4Y=; b=Z+V+Uc3bFR7qMd5Tlzkta/hlJgQtLWAkUx8cYms+
	YAVHcbGGRqAP2C+adpTdT11lJzWKerA2GktZs8APnYAbRvwp17vwsjyMrqvJDwlW
	YYBMljWaKfVqwkc8X8YCCivb+RF2JKmiPS3BxCPd6KyImgtudaWGso6Mbt8Mihoa
	h3ZcJpY8zWQQHmToMAtcJkteuhuxn3kkrEMsUhSz+Xh5lEtC+umvK1YBL5R+U3Nh
	7sNa+u6KwdoG4uyDMdVwORV01WLDGq2sQuNlEf08MtrArngLkx47XEKTNGEwZ0/+
	Y1lSuC7rzgyrvXYqpun7eXNWuPpz9kcM+KsZdtIa9fHhFQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfygm09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 10:23:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9399b66e0e7so251300085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 03:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788776634; x=1789381434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tJDqJTCqI/57p+zQssr36qnZiecBMtZIMFQgWWk9P4Y=;
        b=T0GrazFncpn5VpkHmdaNY+Au5YQmRHnXx5xS7h4XfEPTy9ei3cQxU6iZIRVISlM375
         oerQoKnuvCEbsDRSTb9eqgzRp3DyQEGWeVBjXzeWBNo8pWRbYpwxn04Wo+2tuU2dbR0P
         SwvlZgRvcZjh9bQp+URAxfWAyEryhhkWktHLWuKtx56J2vXOrI/jWwN5upoSs98BcPNO
         Ir80Ins1LZaP2QVwR8fzcUUyoJW4XplUrkl1ajA8156/D1lXQRaPfXpZJiAfNocqSXKW
         zZwJ+tZgc9b6c2utQdxqBdL5fS+iFYwVI8ItRxXQeEO8zaTZO49pP+8m8UCH9fHlzyVF
         B3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776634; x=1789381434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJDqJTCqI/57p+zQssr36qnZiecBMtZIMFQgWWk9P4Y=;
        b=n9Cg9OAUWvWNweuFXgQt6BXLGBpMcsQEmXq8/k9ByeqOfotnsNfAZ29F/zRH45KS1C
         oTucznG/yVcUn8QpupOnB02e9k+l1EDMUoh5T1wKUmezVAALDHB/G7Jxd4F1QvGZe1mg
         yDAD2uH4hcwshdZymxB2I3E5aLyvktwDsVkm1ED7DFj7g4XsWwZtZOuy5JoDSt0NNeWQ
         A9T3r58G9gsEbEXxdKhK7QXZSrRkKhmwqgX6FvRuDk0DZhP6KvgcuXy2hiMeTcC2Tvhk
         0arEko9aB54hNth5mZmplOQFWXQexwTMFFZq8jPr8ht/EXqsQG8H54Vk7Q9ksmP0EkM4
         Ztpg==
X-Forwarded-Encrypted: i=1; AKwUvBxcXyJuYipZh3g3Jaq0w2s+yWCi8HBIyoqYrlh4SlleAnpKbTQJaUVa2EBiim+FEXzXH8PdeKj5qXGdeu8A@vger.kernel.org
X-Gm-Message-State: AFuF++noAX25NpTHAFSBm7Z7SfoPN/Cs7yMwkCyn4LMa/sAxIRG3xWr9
	/hyhJsTKHryKY7Hm6hn1leyeVcHmvOJMEQnNlA4qZfi9B5geCctytnCNz6c3J35s9xKgsDgFCui
	ZRngz4drdDPqcezrE95qhn+GTkscQQesXVgxM3A3LNS5i+8GvZXbG1UXjfs7pa1gTH+Gc
X-Gm-Gg: AYBFou16v52Ru+c1lJx8uwqNlN2YxbVN0PBJNJmyi9PFddLyEw2qI0WfO2nirE1l1V1
	alp+MSUge4Fe3EkdyiITZi8VREd50VPJCEhWP0N32cbl7vmSk/uOxsy/HLmBi3AptWQvVmCSuDJ
	e3UbwAaKdqyBh3N7hQb7IA6CYHaBnejkrUT/1ippP8dGIb80X36RDUqLYZYNg/fXjT2AbQRksyG
	pDBQ++RffgoGjO28IinXST+5m+er5lfwkMonP/rGPXxyQj/fUdlZ/sUsHW1eVUKkzrEVSRiEuFT
	vhMs8THhd4M6D5g+Xff84OVXVwxHoOWUQK0DIZ+EDb8EF2cuh/FjEmzk4XM+vHrKItStHH8DRgn
	JC85/KwBF5Io6sg==
X-Received: by 2002:a05:620a:410f:b0:939:112:d526 with SMTP id af79cd13be357-93980361ca2mr2334914985a.18.1788776633727;
        Mon, 07 Sep 2026 03:23:53 -0700 (PDT)
X-Received: by 2002:a05:620a:410f:b0:939:112:d526 with SMTP id af79cd13be357-93980361ca2mr2334908885a.18.1788776632956;
        Mon, 07 Sep 2026 03:23:52 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm26488749f8f.8.2026.09.07.03.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:23:50 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:23:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add FastRPC support
Message-ID: <ztw6gups4eji3jw33fdcgikrxx6o27glmuwfmzzo6gghzgz6nk@e23oq6d5rb6c>
References: <20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com>
 <e2b0e9c7-c14c-4a93-845a-50a902c6fa09@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2b0e9c7-c14c-4a93-845a-50a902c6fa09@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xLdyAlrZd0YwrW1e9a4vB8ys1Qc2leGp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMyBTYWx0ZWRfX86OrX8hkikX6
 L3LuAOlZB3aR/vXaK1tiJtVxZa5UNP+VIbMdRBZSNH/DGjDqZdEBSSDRLrb6U9O5NTPYgXuaJHN
 OBpO0LaWjLncPG5YLcVac41qFJFNwXfG6ew0XsY8/WJfPAgIVBEJ+Z2LuX1CK+SfAQMKuTnBGIX
 2emOUlSQsmjZDyDDEO7tuE+L5PJ6cgvCvZ8v+gFIpMiPHrNm1K6n3Wl/BHfNuon2jbpOdgxA2VR
 1+vQFuWhfS2FMmCIRuz1ofUB2ypvQsFmads9UUav1uDTqTxYNJsmZH6MdcuNhqgCeD/M7GFSgt9
 EPWVPQFN13TnLI4IwRIiUGU1QOoEyQvAr3mRjvhgvz+uW/SmJ7NabvV8RDVduI3mGHwL1DNP2Xj
 XtyBC11uduBR3jc8IW8AwUUkE1N3FYWpXVeiRDlRyAEJREKEFRnc5tsw1wy7FK9U1YiI3w3UGZR
 w/tZHHoxL3fZOKGga7Q==
X-Proofpoint-GUID: xLdyAlrZd0YwrW1e9a4vB8ys1Qc2leGp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMyBTYWx0ZWRfXxUbKkVdPXc6F
 l+/XKmPGyRffW+dmYd46fm4Vs4twPrWggDoaO6SKFMUCsWBdfFGXYGjKrg7feDJVQxQzeDHkXK5
 a3a88zRiwtG6GVtw+yBrBpHmRzMC8jc=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9e90bc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IQIXi7P2SUzvV5KgbDYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070113

On 26-07-21 16:36:36, Konrad Dybcio wrote:
> On 7/21/26 11:30 AM, Abel Vesa wrote:
> > Describe the glink-edge for CDSP and the FastRPC subnodes for both ADSP
> > and CDSP.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> > FastRPC nodes were not part of the remoteprocs patchsets because they
> > weren't tested in time in order to be sent along.
> > ---
> 
> [...]
> 
> > +				fastrpc {
> > +					compatible = "qcom,fastrpc";
> > +
> > +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> > +
> > +					label = "adsp";
> > +
> > +					qcom,non-secure-domain;
> > +
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +
> > +					compute-cb@3 {
> > +						compatible = "qcom,fastrpc-compute-cb";
> > +						reg = <3>;
> > +
> > +						iommus = <&apps_smmu 0x1003 0x80>,
> > +							 <&apps_smmu 0x1043 0x20>;
> 
> nit: the doc specifies '0x1063 0x20' etc. for the secondary
> streams. They are of course equivalent with the mask

Sorry for the late reply.

Will use 0x1063 instead.

> 
> [...]
> 
> > +					compute-cb@7 {
> > +						compatible = "qcom,fastrpc-compute-cb";
> > +						reg = <7>;
> > +
> > +						iommus = <&apps_smmu 0x1007 0x40>,
> > +							 <&apps_smmu 0x1067 0x0>,
> > +							 <&apps_smmu 0x1087 0x0>;
> 
> Why does only this one get the tertiary stream?

I'm told that it is for some different subsystem stream which shares the
same address space. But looking through the SID mapping documentation,
it seems this 3rd one is not available on Eliza. So I think I need to drop it.

> 
> [...]
> 
> > +				fastrpc {
> > +					compatible = "qcom,fastrpc";
> > +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> > +					label = "cdsp";
> > +					qcom,non-secure-domain;
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> 
> also 0x0c00 @0 I believe?

According to internal doc, there is no S1 compute for this one.

