Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA453F788D
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 08:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361527; cv=none; b=pmIRecjeAU2DmhP9xw0EG/cHwAqkMpQ0pmZQz7oftTbKKR6dcn8EzQDp4pgvxJ2h0TzrChdy+z41TMToavxF5lleQdPDhC87dS2tRn2KswJp//BkGKBZDcTO8x6wMN6ig/snwTVV0hOEP7Qn4WipLJ1DytizGClsOEAA1afBK68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361527; c=relaxed/simple;
	bh=ZDYszNVEjElmxLR0VTjx9YRTaDAmAgUHSJvjzGCh0RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOAi1uBcERr7J9stDyiw0YfBJ8XZAGrGNHOGCz5XDtuu9C8RZlXcDVshR+bx27lQiYgdOpY+wB+QcKtEM+GgtFY7sFauy4ODYrqk3YUFvaJkHDe3xvar7KH3gRynWxT+fhy1gpn3naFPxZwQOluHTjN2w+6g+ADE4foHgos6KAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HacJ4tN4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kO7qGJug; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HacJ4tN4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kO7qGJug"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jWBx2481348
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 08:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pQBG5SbwlH1RkPs7F97Dw6PI
	C6xi4Vl8Iw2NiJzks4Y=; b=HacJ4tN4Qg83bgXfxkrxXlkf0wf0zZ/QGHe9tA6H
	YS4KXyMLf1TCaQ6GyHXpbbtBEfiXaWGJjRP4KJ5sAm4rh91gENY0Rgz+3drn1nN8
	9W1VdaOByzp4M3ZEDdJsytQp3eYK3ebhhqMXEiukrZbjw2kpp++/3EM4ASnABh+7
	wgY0opeshwrIzYhqiM5bAgJmvJslw9Vbf7CGaZnYXNjkBPsC7jXzCae6wG7DSbFl
	TpHnKjnOLi5QYtRjjdn+ANXPR9WxgPus65/AEhXGIlH7MpkeOtAHKdAv+JJdiudB
	MquMgxXuIwzOlKXyo2E9M3JXhnONimoyoYVuoSM5RNRBdA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u185r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 08:25:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510a481ae9so7367113eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 01:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791361525; x=1791966325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQBG5SbwlH1RkPs7F97Dw6PIC6xi4Vl8Iw2NiJzks4Y=;
        b=kO7qGJugi0BVZnH9scWpwxe9vPW7k5uK59bo+DLueD5W/tjVMDNd1sum6cE5fVXZxj
         Cfn3LP3rsXHqZAwDhBPrrQkPz6zXveozPb8vflqF6PxwZb08dqYuatVTpuOeA16JfF5N
         h0xnFzthkEnflEIO19/bm+8TP9sody6dAi7+rftB1fgtXYrEtDPWOMHEGmL527BB4zFo
         xDqzG1sXm+cpeupohaZl8pt7tWQcqpgbdzDsjqsxacQmfxnBOuhnxPYq+MTWaFtR9k8y
         3wQ0BLD8am60PNkKJC6p1MgqI6KoynB8Ked3RNxl270nkVIdj4e/ouLF9rwClgjOGqAi
         2/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361525; x=1791966325;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQBG5SbwlH1RkPs7F97Dw6PIC6xi4Vl8Iw2NiJzks4Y=;
        b=IvvPfyIAIAFBL0lYqBV3tARu5snfRRnCRCg2Ogojrk1xtiOcEPTbQBmaaPBNlXi+4E
         mVgRLQOXgCPLSVY0DfQ/oyY7oU8y0mvZc+RaxJSojAlao6ko7hXyiTna81zpAWl702bt
         fdkcrf38EH/jm/OvClmZCJl7Heq+X5mMd7/6jYv/FeAzFXgSuK8Y/3SfqxNWhdDdRGPC
         TsQUHad8xcDDVQag31Oj9O2HRs+oo7RkydjqKUSLMVT4sKM0YiFXGegad7laTsyruWQM
         jTk2zmH0gPsW38jIjdez7C5Vn2V4Z2aQ0E+4iclBJQ3jwq9WztAFaAnax4YfoGDEk7Dd
         pYNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwUuABzfuPQmJz9iolurhe7MhOYsyYsdCWDar9iUqFKOPqiNumLkq17kBLqraxeStOsFBXqzd35dKapSjy@vger.kernel.org
X-Gm-Message-State: AFuF++nkLojKkpJBLIOFmInG4SDpMtZ/fhBMamYZouyQfofIFj7dpe0G
	CuNRD/OJyDV0QJ36pH3ozdZ1LOh8DJURMXHNnXuWE6hEOBr8yaiPxqBd6SGZ4ISZ1g/ufCayjW2
	6tIOCFg+4JW43asYtSJX/rmmEHbhfCfsiElJgp9Y/1LAoZpOycpAmhWkMgvbNBGruWhfWVd9soc
	wZ
X-Gm-Gg: AYBFou1vwPfBDQfQQuUrxKXXVpKmClG9ClfjBSwD47BMXiHri2RxDn6pfFKQ42G4Dc1
	m2w4mOW+Ur7OfSn/rMmGiushst39XKXeGGATGbD8z7iAtmlhD7if1x28A0gyJViYCc4HBT5drtn
	aPdrxOAdjqc5xY5gDuFg4pzXmGkeu/m4dKQy1z/a0HX0URvR9O8YD/1jgQIdZJg3aGRPcRENrxl
	m4Dr5n5AH0el08YOtPp3Ue7HJrsnJxOU/B51Ll8QLh43V546Xf0FUbwZ584nfOzgC8OoFmjMQsC
	QQ2YyqiZqEVhR47QkDPJYKfLnENBg7knBuTgQPsbiWlksTlxURhILParRAFSg710vPkMEScFroV
	IXds4yRHk6lV+cCrP8lFBCXBWyQ==
X-Received: by 2002:a05:7301:32cd:b0:34d:2c1a:987f with SMTP id 5a478bee46e88-3515de554a1mr1487963eec.35.1791361524858;
        Wed, 07 Oct 2026 01:25:24 -0700 (PDT)
X-Received: by 2002:a05:7301:32cd:b0:34d:2c1a:987f with SMTP id 5a478bee46e88-3515de554a1mr1487913eec.35.1791361524067;
        Wed, 07 Oct 2026 01:25:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb6013sm5961752eec.5.2026.10.07.01.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:25:23 -0700 (PDT)
Date: Wed, 7 Oct 2026 13:55:15 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/2] dt-bindings: misc: qcom,fastrpc: Allow hex digits
 in compute-cb node names
Message-ID: <20261007082515.xmjpa5jjptgrl6y6@hu-mojha-hyd.qualcomm.com>
References: <20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com>
 <20261006-glymur-dtfix-v3-1-44e2bc5370c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-glymur-dtfix-v3-1-44e2bc5370c2@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzMyBTYWx0ZWRfXyFbjNmRxIJPO
 R94FnGvfFACM/vj3DmFcNh6KyvtqC5+l2Zz/vpHNj/yw0DXXk6yOH2AuZ1Ol6STZtxAuRBSp/os
 xHbnH7q4OiPfph3WO7y9ccXAuUGgE50=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzMyBTYWx0ZWRfX4IfKi4sKylFH
 mkKxcT5fi0ZIq22uXC0PGXdMYDsgGzSfGGgIiU03U4Q7Ds5aMErerx5e1sVCNo/Ay4J4QRI41d7
 E/ceDSIO4GP/Rh7n6J5MXh36muGcJ7/m3ifGg8xfnS55MsZ/AS/VO8ObY9FpCePFME+XXvcGN12
 IfOXYYcYURPVMhw0EqimJ1dvW8jfPjmRR7Q8wSst37yck1eujjSnlwU4wbWfKdv4XQPpIXCAjSP
 W338Opj1rChynTf1rJSlPe9YoMNbgOEhkc88HAAVm+++hm0Jpk0e7Bm+YwzXAV1NE2El9G9vDRN
 ch4VD5E8EP7m+qXDIMS5/OHKf333Z1frIuR3c0CwHTWuGaEdly+Rk8y0kRptHOmB28ptVkAT8Ba
 hfDGsQdByCGJMfG43n0dwlhYIgz78OEjg+nnvak8zNRZ1AnvXPQyRT+hKov2KDWycFThgqzlLv2
 enW2SoV78NU+YRSz34A==
X-Proofpoint-ORIG-GUID: QRug3QpTPhiErMXMw1gZ1mc-0Y-4HNo2
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac601f5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QGBbWe6yPyKI6YAsb-IA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: QRug3QpTPhiErMXMw1gZ1mc-0Y-4HNo2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070033

On Tue, Oct 06, 2026 at 03:56:06PM +0530, Ekansh Gupta wrote:
> The patternProperties key for compute-cb subnodes used [0-9]* which
> only matches decimal digits. However, per DTS convention, node unit
> addresses must be the lowercase hexadecimal representation of the reg
> value. For compute-cb nodes with reg values >= 10 (e.g. 12, 13, 14),
> the correct node names are compute-cb@c, compute-cb@d, compute-cb@e
> respectively, which are not matched by the current pattern.
> 
> Extend the pattern to [0-9a-f]* to allow lowercase hex digits, making
> it consistent with DTS unit address conventions.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index 49d2a5e8ba39..14fed91fee50 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -79,7 +79,7 @@ properties:
>      const: 0
>  
>  patternProperties:
> -  "(compute-)?cb@[0-9]*$":
> +  "(compute-)?cb@[0-9a-f]*$":


While you are changing this, original change had * which allows
cb@ as well ? should we make it to "(compute-)?cb@[0-9a-f]+$":


>      type: object
>  
>      description: >
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha
