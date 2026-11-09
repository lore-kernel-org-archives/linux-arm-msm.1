Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213843;
	b=1KXn+0XeCeMCsg57O8FSAWkOWqDdc974O3UrLe9jeg8M+n18ZhlD5h1Fohfvnfp2G2NU
	 PPibiVOCGC5Jj6EzoqcakjK2llp9dzTU3/gk/cDTgblpWg3+6q7IeKDDYJQUKzOtchgPd
	 w8UE4sfWffectpEMJRxziTvNjlGPIGZt39YUFpcKIiHiG23/k1etx3AiHrRFyrtL7J2SU
	 DWDcLtkEdLMchEZUF2VZsy3NFs6NjIWd+0n7AS5Zp4g4g15q+jeCQC7Fw+OGn6Jr7F9t0
	 a4vr50IHv6IVxj/yqV6hrD9/h5K7GrnUa0Z8w7CCNTgU3u8uWdQ1TqMxXtZEGIYcr+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mprexWtZNDRMwk+G2v0uaj8aq1dqkuFGRNlm1HMFGvM=;
	b=QCjtbKk7lCVXiBRHlogpjuBK6CbVJGtxiPha5J7CytMr9Dqb2evLViap/y7BziT67lpa
	 1K9/ibmkQX/BNlEMU61jYQtV3pDWw6LEomqDYPHBsLofa79Bzyw+CSZO1FYgmyJM0Bywu
	 /Kov7kioUHz60KVQBn9N3ANzgrtVgwCsbLbMFXS+W1oK2jViWsungtZF+fLrLuxL8wmzJ
	 QAaep3YqwvLMVo4+oWzwneoZAa3AmMA9fg+4XM7HW/BNSDh6Cm1K6Eq/VotPi3QbIN2PP
	 u9D+wNAzY8uht8niCKv/PGI/D5Q/bt452DZ5iNVbkJQ5+spNgQnO9lLv8cIaxs4cDtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Oj0eK2u/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dUmWnG0s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D867E606EE81
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 08:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D867E606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oj0eK2u/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dUmWnG0s
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A0FQ3580984
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 08:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mprexWtZNDRMwk+G2v0uaj8a
	q1dqkuFGRNlm1HMFGvM=; b=Oj0eK2u/6vE3/0SZR97f0Xlk1Cj+xcfdD2fZs0E1
	LFdYZqTN2Rd7Da5RKdTijzNs1u0mb1EGkCEBuCc+1/0yAnTfHwXYZMb68kj7QqS3
	B4aOYjHD33ezrZmPXVcHfw0fDSo6boNqyq9q2iVeAZ/bAoxGnwMjQVhQdEiKDoeT
	A/l+W7j8S7COn2fHrsjTgQrquo5oN3Yfg5ZTfJPQOO9EnM04u+eKKehI9UIymAOB
	4sakDt95XRdFrXQcEGfqUnC0zWRUas+HNEzF/Dx8HAApATTM9WCP/Nfc3onCjgZQ
	XYptwiXqlSX+KoBZTTrRYUMCuVCKS+G7ouChq4VjPKWxOQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv735e99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 08:44:02 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2eba206f4so500544137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213841; x=1794818641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mprexWtZNDRMwk+G2v0uaj8aq1dqkuFGRNlm1HMFGvM=;
        b=dUmWnG0sZkUcFV0ud8mzOU3tbo2RFWh5gWof52clB6BfeJKT3FMeT4adbITA02fw12
         fZ7Tdt7NDsDR4vHUyVtq3ofwn7N5Zn7mK0h9uqP9dcH1VxIppbXwFsH/J2sDBm2Axe+h
         +v+ZX/4YA17vadvq/RIhVeir4Q36Qo/LJUuQUsfeiRYPhu8Rnzs5bo9npgacenzmrYmj
         //7lxgJ7jo49rCFeOIsINnVnphGKe4PJI54K8qy0cC8MySM4rz3m+5c3RpJ7SHXLBNyi
         yMBENRvTWju75+pBBs7kNQ5gpSv4ezeGQaQqTpWVrxZtwK4S963ssu4cNdYXZo/yAugx
         e29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213841; x=1794818641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mprexWtZNDRMwk+G2v0uaj8aq1dqkuFGRNlm1HMFGvM=;
        b=KD78IWaIPTjMAHQrszyqvyF0MqpzVAkH6myewEDY/vd0V3oP4T0rXU1F9yXA/03dxq
         N3kwZyZ9Mk3fGjQmfwT8d3Cq/8Jd2MZY62sw7vubwily8RBGGR8q9hAZ88VkZF3btNHB
         /wW9eBkePxgBcbob97NoaVGGPu867DclNE6P3AiV0xjccp/lkls0tv7waZA7AJ+igmPr
         ykcteN2eiD7oJc262Wde9xcgTgQyR3Z1ukbtoXunRbPSwLIgP6zcLDGbnFLPx/ACYb05
         x2EkQFwyk2o0HJaEBC8vEtAUTkeVh5WN+GdK3YKTDjoI8TD3EIQTtKtgjkjEmaDQ6U2d
         OaxA==
X-Forwarded-Encrypted: i=1; AL+hErGgerRD1lOmdusk6NcqFd1Gg35COsGNUCCRg6Ng61bad8Jj9W7O/MKOeaGp/PnOmNTzn3VvR4Fr35VB+GlU@vger.kernel.org
X-Gm-Message-State: APuU4Z/KtMhBQtBge/l+pS7SLzp48oUZ/QrDjYoff91C6xXvIYTpSz8T
	UtSN+6Pe3Ez2kuKe4h3uX8crVOn0KMznD6zvkpdRvNlct2zUv7BTSAIsX2dFlqCVMQd9GkqlFo3
	2JqMxB5OC6uogNopMvYnojgynq7RBi78HCZLzO8mx1TjlVQQG+1Nb+GWJ60CyRqSGJwD6TajKEr
	OM
X-Gm-Gg: AYBFou0KhU7G2qD2nhVO3hUPmc515+VHX43Nu9C+5EVordvsh6yPbIYuZEX+0wQ36eI
	FlcOyIzIoR+I3O8LEjSsbSelw6Iy7b44oADlBpVEmbW4io5/B0U89EF0vtd4K4loiR9K8iJrzIb
	AyCcfjVGWvPkax6kN/VvQJNiKfnxeT8ZeNWTbW8WXJ/j94LZVRg+p4QidVQ1iofdWyYCD4SZCzR
	f1OddbpS4Z81adFZcoY1azc2EmGpU0ZMdMpeYVh4WV+UK6rt8lZ/AdMRzFP6dzU966Db+vn5dF7
	A/q1wMgcxOV5kjoMYBtxw63oOu/mzAY2ALEgRufmnSP1IrlO729zd8Soj1XaGma2drSb8Xv6fci
	7M3giIHCq1O0gK5+5BnzZ2nd5byCvlrPn5Z7MTZWEYMbEcsia+A36A5iuLe1q2gs=
X-Received: by 2002:a05:6102:3309:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7d2db220cccmr890402137.23.1794213840900;
        Mon, 09 Nov 2026 00:44:00 -0800 (PST)
X-Received: by 2002:a05:6102:3309:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7d2db220cccmr890389137.23.1794213840331;
        Mon, 09 Nov 2026 00:44:00 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597371cc4sm8264698f8f.36.2026.11.09.00.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:43:59 -0800 (PST)
Date: Mon, 9 Nov 2026 10:43:57 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: glymur-crd: Fix L8B0 voltage
Message-ID: <qsrxmnicjhmdsdkvcl3nnymgsq5rydacirrp32cj457twaryy2@xl57osz2nawx>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
 <20261106-topic-sip_cob-v3-4-52cd3826ab49@oss.qualcomm.com>
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
In-Reply-To: <20261106-topic-sip_cob-v3-4-52cd3826ab49@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX2xqA7JQ8+kjt
 ps5Fp7PxTxo0VSsyvlLq5IZMsIuOrkaeBaq46gaxgThO+AbpJ8GgCzxe3iapYLAV7LVrNrKQkP5
 dbKMCQpDpJ1l2aD2DSk+fRzUxzQyVELByc9YHpV+0kcp5WpLdmgTxvT3Z8xuOyLf/p4d6sy7g1h
 HlMxF66p7kiW+IItX5XzkW2PhtIvY8UsrPmKHYYvGa6Zt0dV4G3rBpZOCNzXeXNKo2CrqM26YfJ
 5ezYvNFT56W+ehOvzMi6BGRzjyo5KDHtXJP3QfvM2cabgkrb+YdhbsWJTjtABCFWSpS+sedZlfk
 OXksfsLnhxV2wyai8w2Pxef5WutxCogfLbYf8OdFFm6GA2ZIzQHyzd+ioMcC9q1AXHxvNgdwSRZ
 wwip5ViXI6BXrIceNO+YX/5nMVlPvRCM0dvtv1fplPCjOmhcEbwWyAMqoXpOfpZkpU+ZUQbaJRe
 +RfskLgyMvxTxqJA2HQ==
X-Proofpoint-ORIG-GUID: TEDpyLXygW_3WJ3SANUWc23hMtfDKZ5e
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af187d2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZkbxzI2-Od9abTRmLGAA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX3kwvXwgzM3Kq
 8oiSd+Zhu0L2HlO1NHrbvsx7w9NGkZTfQbP3a+DrfCi0cuwk1G58QoEum2BwRqSVSyEU4axd5B4
 DeDITfz48t8gu1/75hplVpyNCAIic4A=
X-Proofpoint-GUID: TEDpyLXygW_3WJ3SANUWc23hMtfDKZ5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

On 26-11-06 10:29:05, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> L8B0 supplies the 3.3 V rail of the PTN3222 eUSB2 repeaters, but is
> configured to 1.504 V. Set it to the right range.
> 
> Fixes: 9314c6ecace1 ("arm64: dts: qcom: glymur: Enable Glymur CRD board support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
