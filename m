Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A613E639D
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371488; cv=none; b=qellU0jWB4XTMdBQMJ+nOqF0xqPH12KfMwZHW2IcHDrkkXaEG+k/JQYd4XJhGfB6uzkfhtKOGTkDJ3F4UTBWkuO6vePxFCMFNrgf+hQqc0ktAWT0jgilFDX7RMBQLydiXRNNN2tbCqYjnNOvsxit21ATMCr2PwsN9y5AzXgdrLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371488; c=relaxed/simple;
	bh=+mpb4A5u6+KzZjEaVLebnjWUq747ZMbiFGTj5YmPX4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nK054Gkn1OHvfDPqLKpeIc/J7FFvbeVoDj6g5Je9QnBGUmvxm0FVOye72g4LRr3w2hp7CcSfDci7ovkMoVtSSINNc77qDRWNEGBgzXREDOFwtgSLo0MxrlIGQHJdyBCG00tzRZNy0DHyr6ynYhIr3eo0hrautHEmCpYN2cBe5VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iewX+SXA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VSx9/kD2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iewX+SXA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VSx9/kD2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ikXH3196157
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sesOnjY5IwG/EYJjr/By3L/2
	HHUhUu6qJhwhbmJkicw=; b=iewX+SXAD7uagXkBKeMj+hUwdOz7GuJ5b3PNPk9E
	zFQ/KSIyhZUD6JK83+q7uZbo3KiwGRxBNvqgjNlhJRgnPP8RdfEXTbOvgKjVHV6n
	iFcPkjTcqyuOw+AlaSi8FxR9WEJXWwzR8tOcolWQYp4Vw1MDTD5nkLhkXOqxqA0Q
	0WEpZXFwuodRkcbM6IrllBQPKHtzB4CEuP/Fda9joMqEQVbYuDQ+t7isnLwAVtco
	169gF4s9nzFqOzlmGqRh354UGI2rzKdzQi9XUWjq67fZxm/Odv4gt+QR1YC7IUuh
	CTlEWKzkapCvUHDgXWs7zcamzJEqM1e/TVEcOPs4hC5E0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cdhgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:38:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1b824e84so177912985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371485; x=1789976285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sesOnjY5IwG/EYJjr/By3L/2HHUhUu6qJhwhbmJkicw=;
        b=VSx9/kD2quylb/aHTaa/aOHVjRt6adyNNPzouCpY5bfVMYd7Q2ZNMIeMv9g2sC0eeA
         MJbse/k2wHWt8k8Y5rCvWSbYlBCt+M12F8fcGosqAw2OoR50y2ZXhD3FBsplsEDHBTWL
         RMqS6VT4fKWn3SF6/KxjlXftXJfHvoTjxUGeEzLgB7Jwjrp0RAUZxNC+i4V0WeT+vjqT
         NQRxxv4SoyydQIggb40wctQI3YlwYwuYJhUMYt+OgWYlBgi3tGGElTVOkYUq5RnX5S3O
         uXdV5q1k8WJy0QCAerY+ktEwp9TuivXCr13sQ5gPbx6P/M1jbdmWsfXTcH948Ht9Ep5E
         Wr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371485; x=1789976285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sesOnjY5IwG/EYJjr/By3L/2HHUhUu6qJhwhbmJkicw=;
        b=qTg+iQm9ID82jE7Q3FlapIr1woeRkvVn86HIeqbygePkDuNYumpC/j/JX4yBGe1XA6
         rC4SsWBNkkrxFlKOw4cwJjuLDiSqw25Hi59hLbU0wYXsBI8b77wBzmiDA0QW/J4q35W5
         vsBiHtQvwkak+wDGGMbPnz1B4GETU9sEffWi/PhedtEqJWU3cD98Qqn6LIbAqBoCWUb7
         4NhMkppGj7AOFnoihLTpZMzIVr9ln8XZwI0dWjwk3pbf6Xjf1U6lYBwhKW64u0EcHuaD
         pJ3qDFQgmkdFEZGY1AGd+d4iquyOEy6HVVPV4klCIy1F3XNA1GnLitzMolPqgP3zlQLs
         nKQA==
X-Forwarded-Encrypted: i=1; AKwUvBwz3mR4DsJuIRDquC7LuIoNdUoaTHmAsyeeEGFW7/GNKSNzOLCCZopGoQYdi1am5377Be9Fd2V/6eew1KhA@vger.kernel.org
X-Gm-Message-State: AFuF++kArdNVDl+JcqZZlYmhyB2Bg1pCOFrThpKyBfa0FiPDe1gubg4V
	mOvSrQVwHimMJ/qLEwHJ/2zJwTicwFU3N2OxQqHA1lBP49p243/3v1OM+dwfb869x6kPeNWtCYR
	adu2khDoamFzL2PF+Jyx1KMA0BlULQVaqOQ6YGkA5W/qhJAX5pPbgHCC1dU7bUMOs6Abr
X-Gm-Gg: AYBFou0+dpiJxxZp1ZS6/d+x4+gAjBGeavqNClzMl1sO2BFXkRiSb00fDj0av0VdQFh
	jLpvv6qK9sfpLCJ3F5gXbJJ8Z+1AgLVd1nbGPxkuw3kkcpwoIFczbvz9qz3Q3AD/LT/ANzSuWLf
	TK5oUM6XLvR6EYI3Do8bAqJe6mOLDi4Sxk1HphwI7riAJPdZHpdWLlQTlK4QJ/nAxcMecTuDXp9
	/HGbbOJ96JKY+eA0KZpNTPn9X8XhnHtlZbc35fhM+PQBtN+IObMQIHRqMxBPhB+4ibHS8ipWiTO
	RrTuxyq/JsZOZ1U2dyMObfprRwStJLNnNaMWR9vp1XmUlgrSEN/nnFahIFxEZXoVZaQvvCpz2r2
	sGW+qlh97QRqzKVg=
X-Received: by 2002:a05:620a:43a1:b0:939:1222:b9f1 with SMTP id af79cd13be357-93a29448f5amr200819285a.0.1789371484801;
        Mon, 14 Sep 2026 00:38:04 -0700 (PDT)
X-Received: by 2002:a05:620a:43a1:b0:939:1222:b9f1 with SMTP id af79cd13be357-93a29448f5amr200816285a.0.1789371484322;
        Mon, 14 Sep 2026 00:38:04 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea4fsm25999935f8f.21.2026.09.14.00.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:38:03 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:38:01 +0300
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
Subject: Re: [PATCH 09/31] arm64: dts: qcom: sm6115: Add domain idle state
 names
Message-ID: <5ep34detrgxv5yhm6v5vra7e7cenzpohsf32xox2o7kr7to5mv@p7cqpwgwkul4>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-9-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-9-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: -aFNRA4waL2znw2JN9QvwUz-zgkmNNX7
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa7a45d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX+SZnQ53TNNe/
 nzHTROCRmODvDO3gtTpEQd9Xv3B5b1Zz2fH8o94sZTI4xahDZWtlVu4GcaoO1RsHiJhMvsEmNR5
 l44L9SwTUhtcTo0Lkqdl/jZvM8GKIp8=
X-Proofpoint-ORIG-GUID: -aFNRA4waL2znw2JN9QvwUz-zgkmNNX7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX4hZHgmQJEbTj
 U3llXXXoMdu6DdSY/3ObFLUrntz36NgJxhNesBCysedxMUYnA9w+lzIfYX6oOfWn7/q/e9SBNlA
 Y31qVFIn/bhfc5GoTCzsq/KS0Nnu80XuzPyEF9jHD+cf8vMiEE3BJUHsPtLkw9k7tmtU9LmBN3U
 sltblkJ7fYW0kbIgAX1W8cbamDzWed2BCA77356U/N5JBv+eD3C7bL7nCU1YAnwC29hNDZHi9Jj
 KIOlpKP6Nu/NJvQclNDUzPoLDVqaEtppMkE9J5gJU4IdhK05FgfE/9H1Hs4h+sf0NJWmwopthjw
 G+neE3g+7YTsL7SxIyW4eTqHXHExjlvCD4Keve2KM1gztfscRrwmPOrot8sWcHygpElgtyydm3a
 t72Mjm5pLNrGmxVPO9Cy+aTlMl7p2y8XqfTxtTecIYLTrrlA8HrqPLzmxjdLxbXZaJrQNiP1UVs
 S7v/nbCuI9n732zvJsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140106

On 26-09-14 12:29:41, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
