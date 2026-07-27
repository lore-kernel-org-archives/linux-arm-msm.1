Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405CA41B8EB
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160747; cv=none; b=dO9VHmgzxaW5/3g6rPf71yescyTAmxTiLIjrwmwgg9NPD25EVr7zCn7sXhZZuze7fu9KIfpGQWSjaEAE3I9cNwhXgQQZ1OG3w+iuvDo6dCABmjatHIoS8rDJ9H+mr84VK0Q5NnXLjMFA9yY12p0quFfRNJHl27XUAsf0YQf3FfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160747; c=relaxed/simple;
	bh=axRm5cQMQQfzCdwEagsVytROKWgdXuljM0oFEgdZdXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkgdEZgXiuYBhp8xspCuCpUXpEVnmcVF880j+PGn48L4ei+7Lcn3FX7pK6ha/MjsAK3a3pZwcS7DjdWGDKirrzG9wWE2l/Nsz+IWU5+3+QxKzjGJxaXSTC27MhNRMjtYa0wL+YAWGhOULOwJANKJ6FUA4OPuvBQ6qyKT04p/x0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kwRv7nEW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LghT745+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kwRv7nEW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LghT745+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlhaW4061124
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K9q69KkJjPhRe489NbyLzvP1
	/X/Dng1mKDhtBr7gXxI=; b=kwRv7nEWIfFJQnbr+qq+cSkWOJk8EnIB0ot65p5n
	1PoN6Yce8d1A8hv5fIPk4qiVAqcA822TqzWi1FDS8mldkRZhwJHMWxlHMdLGnZPU
	YXn8td4QlFx9NxtMaKkCsr1pbVntH67CkBWOQa47i/Rr+3zAYRTD9gl7FAMb//5b
	hdLOQRb/0GNTpnYGL8Y3+XOujmRNLoUBK0jprBNfo4n9zOZLPOH+VcHXApULDSvr
	Lt1oeVc8sxXmuw25OTiVeUfw5p5/1QElT/ge0IMwpz8uY/foTxnwa57KZ+k1pXNC
	qDVLnDRBEqWE+cYfh/OIh05Ar4ruvbZtjvSjN/2XT4H+fw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq11dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:59:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c110a3b6aso38865981cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 06:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160741; x=1785765541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K9q69KkJjPhRe489NbyLzvP1/X/Dng1mKDhtBr7gXxI=;
        b=LghT745++ysx7h6sO7gbFeR+ghgKdliT7ZIq4F8+6MvIYHEt1ISXmJz0JCAakg6Fc0
         agYX4rokOWNiABnuBr7HzpIegcPQYaPuE2Kpuhx+JjZh0r3xl2UcFM1+osQgTIkho3Hl
         akY3EY+8uVkwMl9rC+kVmbKkfF/aFyut0HaKZcuyw8lu1S8dBNQIiI47c6PJ1xVvMBTS
         X9i19WegRZqwPq20GbxRs9vOzQD57Q+BfdA00hf1M5Ef30IdFShpOvcfLurSxlLwwK3e
         HUHCGN3a95oqtih0Vl2P8ByjMFYv6+yzLsAsaP7Msq0OSbud/VhTm5JkuTfT2QRb/ET7
         wVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160741; x=1785765541;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9q69KkJjPhRe489NbyLzvP1/X/Dng1mKDhtBr7gXxI=;
        b=eN1x8TYa4uQCvRCIIc5J1Q1zYj2AnRus07wNcMOeeKOk9+rP5h9e6Nmqm3m828xbF/
         tVr9AXktGiAVHURpCOcVyHEztvdeJNJPFtBdXFMzL43/LMqwWNFvkRqsmqCKcOWjgJbj
         bbzgdJhOr/kLPlSPSm0a7WmJ54IuCxxsfQ6xnayM/QfiiKjxIy8P0vQ8AQuPIja82KuN
         l+LXjrLSshjzkzInj4/Kt4g5t8ceJw1Bc+KMmrFnCzCizF/qZ4rwetzxn0lm99ZpMpVm
         6bJEOOaj0OSpbWen1asFkW/5RInViWGO3Mei1t9cIut95u6HHRxjtAZph2ljIzfoiPcH
         rlOw==
X-Forwarded-Encrypted: i=1; AHgh+RrYVCXKBAUqIsHV1ylBDUlYj5VbOyIEnHrxxkSZWM+BgY6gqz12ykPASxka81fjWjJ4proPEMu80POaDRLQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzaV48zskof48WETn7NqyXfydjKpmAkMMA7UYYQkLFy48hWtjgF
	3D86V2qPCm7B1GgBYyHw90Rp8av018eyFh2UTmqNuT2HOj0a1rrGlSCYgUl/8sKOVQfAkxsf+ac
	aLWhp32bn1ISjg4W7d6vICWAZiPuNJ2hsrYYa5MCMaV8x5sxex3Yr4yXkGxidP341/Wiy
X-Gm-Gg: AR+sD12rwMX4i5EapeOdIo4cwZWE+TPSeYZ5zP0qLVVfwuZhbVc2s2uPVySiwKBg+/H
	tKDnAbMx4OuTVB5Ef1b2t6m8HJ3F6XfkAVxeIYYXg/KTM868D4LlOB+9EUCXuKZy9mCtH+DSL1I
	YrhBWzJRWluxDAwjmS7XAHjh1jtXAk2COVPzEd6zq6+xqEn5l1nxe5cP+XQg+lZsVAPRUIKRB7L
	U2E8PJJoc9712AsbwPna+6whzeCHFa77Cpggh4u9v7Z6FmA/N066G0mF5v63dMtt4Eyg6yhnOre
	cyLHbkr8i6cfAG+dG9bXqcumkQt97fzPRoA9GDdWqes1QEGIRaXUCN0V8cmHh+2GAs7th1sKeyH
	XqYAK8xWuuNeo1LU=
X-Received: by 2002:a05:622a:1aaa:b0:51c:147d:9bec with SMTP id d75a77b69052e-529a833d0d0mr88179911cf.6.1785160740384;
        Mon, 27 Jul 2026 06:59:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1aaa:b0:51c:147d:9bec with SMTP id d75a77b69052e-529a833d0d0mr88179361cf.6.1785160739786;
        Mon, 27 Jul 2026 06:58:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f302f8sm217639325e9.12.2026.07.27.06.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:58:58 -0700 (PDT)
Date: Mon, 27 Jul 2026 16:58:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Add Kalambo CRD
Message-ID: <vxxyjhnsmtfxjaldiytzvxgexebsl4jjwy4ofoj7eeqqljhrep@ybcdvwdj3yip>
References: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
 <20260727-b4-kalambo-crd-v3-3-25280faceece@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-b4-kalambo-crd-v3-3-25280faceece@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfX3Sp/W16V14YL
 ikTbNLihytCSXFMRact0RUluoi5Dr84m39BA+V5VQUi3DTBIux3TwDdjOjqxbz96hEgxIiDMGif
 +8Nc9jMmonwPI6UOvqvFNWSISH3r23w=
X-Proofpoint-ORIG-GUID: QUFMq8w-fLqY2ScbHihX5LV8M4RZGQ6Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfX70VW94lbqXDX
 deO4efKH86T7wrU5h2N8HX8AIJsz+6VZCrDUs4Kz/YNcMFOwCE0c5IrSN74PWjBVDLXPN31u5kR
 mMIvq6oBMHn1xvkGOgywKSdvz3dF19LPCnEOghQkMDlN1XR98i9eDfdovzgCKZOZVrf1b+7eH1m
 6qzH5We/bzItq2cEAdxI+igCmzpwP+XOgEJXRPGrc0zskqz45TmFYCSBlEjMTv8BS2xaQolRLk1
 g1LzD2+FOGR/fXKa1spVa4wchAfy+9jk7fqev4Sx/wyGzBtSRHTNP/CFe7/6lAkRPKAQlopv1oF
 h5REo+9dCWJxp7xXNn7UUuPMJt4IaO+dsGOqWg+RyEjj2CSv7O3xBtA3Qx9gyclZNeHgur+9k0B
 0y+rW4pfMJaRBg080tvTz6RLM12BVh/YckWN4qYxyk/X5QDfFdlqiWNhjWJ5mKldoxX3SMHf+cf
 nN9hi+CXEl9PrjrZ8Fw==
X-Proofpoint-GUID: QUFMq8w-fLqY2ScbHihX5LV8M4RZGQ6Y
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a676425 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Hkh_rGh67Udisc0sesIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270133

On 26-07-27 05:51:40, Gopikrishna Garmidi wrote:
> Introduce support for the CRD based on the Qualcomm Kalambo SoC. Similar
> to Mahua, it is pin-to-pin compatible with the Glymur CRD. It reuses the
> common CRD board description and drops the PMIC nodes not present on this
> design.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
