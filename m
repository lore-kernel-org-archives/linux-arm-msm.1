Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DE5423E8B
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530354; cv=none; b=uxMyPbh5qFGCyNGmdP/6iJE+/OwezKc6mrw6Z6xblCUe7NF0Tnt+5EEOy3stkxTciVGjcLssNu91wqOgrAiMkVmB+gTn/G3968GJw9UbM7yNRo53F0Ge+OnarVhbFUe2oMHt4YzWfotRRRxA2uDfxrTRk6CD2fHEeGnH+QJkeMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530354; c=relaxed/simple;
	bh=43ZtxLEQgEc2nSYw8I6WPRpkEw05Y+onxKctoBY5fQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFCXTPFsumQca9/sgz5/E2JhligIpH1c1P8XD+9QIBWWKx7MPBikCM92fG7ni8XSne+CfS2Tx7wubO7L6S5Tu8ZcKn+iG1fvgGHz6YvUEZ0ymYss4mnyCbcAYDAQODCe3QPQRj1miBiPBLUCeW2kau2hsLYbXq/jBXO7/hnh3PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7tDQPsa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FYNvFkiT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7tDQPsa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FYNvFkiT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9fvij3777911
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=itKa0IklCTLvkwuwODM59UvU
	btDUS9Pb4Fx4zsEu4jc=; b=M7tDQPsaqnGfQIPLcHDUggEuErnLz23CCNADcQpg
	BdEY3vg4MfTWDCf2dW1A32dE5BG1q/+fRD3FFURlDTzSTczLqAXBPu6KKgkAw212
	asqFXGzinwws9PfL7RKZ2w3c/K8SoHijmdm9xtUOMXyEgM+Ig2pz8eomUTirztYl
	dSMlG8Ni0ZBa4aNdeCuz/qGkAODSZ+t4FRBc5foiAWmN0GjiOfyWPVA023t80KGW
	MZQV1C0r4x82QMl/fpbhAXHp3sK+YnFCci454RDFXAYKqIgdBMWMJgl6KHQVF+fu
	Os10BIxgbvplwjM+sD1yYvySZEoV/v9qMnv70QObqvhukQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nucgakj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:25:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0e702df8so5655481cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 03:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786530351; x=1787135151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=itKa0IklCTLvkwuwODM59UvUbtDUS9Pb4Fx4zsEu4jc=;
        b=FYNvFkiTlROd6wn6Xc5AWxGyB6zy664emIl1cZ76wE2jfhJy5ijO7e19VVmLt6B7S/
         PvPg1oUHClXNCFAvlNa6Lazgu0bRUqi9FUPcmsCASIJxgrGN30k6wen2f3J49ebTLjvv
         oaSbU4MX3H2jZAkBJyAVg/ImSiW8nV2KpOEIZ+YdebBF2NtGpx6Fc9rTwCy7nH+qTX7E
         dy4fcRnKY4BU1XgtX6GlAweyGuGv0lDUGBBU8Q55VWrPcBysOg7zvgi//XrZhQ0Z+wtF
         aYbrmazIVHJLuENwGi8ozMy7xAauZkjuLWDUCfn156MVBOP3XTc3YAzmYgiGIjtD5Wvq
         WLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530351; x=1787135151;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itKa0IklCTLvkwuwODM59UvUbtDUS9Pb4Fx4zsEu4jc=;
        b=KPU27nEwO0k10nX389UMo2BzGwSQKHpzNWVMUPG/cKmXujF5zkv2w0V3LhAUYmqUv8
         x7Av2B/2Lrm63ows79oIi9OiA9AsEkU3ofd8XuzgpXP5/Umw7kbyc3sWm5/pOQ6IQAvp
         AQ2S3R2GzEOrzISSjcCTY7dtazXgf92KuqOESIdRiZjHaYX+mXcXbUQ6iCpjphBi+BT6
         yUNfR1IQnGTPhNYpEmvLPFd6j5ViN6w2Uc7QvnsVVyFUPSQveilegwp/rZQ/D6vEJd/o
         1gwf+9ah+XJ/IaAaGBBQIFkiWkmUVrjHtU+xouKpBxwR4T/Yz/XXhh90bLCod81asGSQ
         9lsQ==
X-Forwarded-Encrypted: i=1; AHgh+RrErh7MNr4Kp+RxX1Id7hYi9fPeJHybTCAQu6hEGSGZQD36OL5rihbnVi3ckTdmyQFIYAJRcx4sdjdRU1G6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+EBXOwt8/Q/f2D5gHtXJWsB2HKYeCocUgtBMBrde/t595dxfb
	sPWwG4LACDFqxaduAXRaorK8CBt2rlhIewYhKQphwDMWXCx3Q4o0pv2Sn9Los6eI0lTO/b+oCfg
	5A9HrNJ4mOXqVjiqRhV44xVnNrSkcjKI/b9mJs1Ch3hWa0Z5cS7E4mhZlJGDJlXYOMr8/
X-Gm-Gg: AR+sD13h3pUu/QaQN7rPDjaQDh3cY2oPfxO5ch479fpw7xqU18TYw/eSZtH5axuK40A
	xRqHixABsDLXVeuJuCZ8B5BZYZnylC8IbG8KN/cq0/Pb4qhUki2NSeCEfxRMWwH+MIMj8y43F/b
	DPWOtxaqBbhpWHKxiLLqq/H2otzSfhkBwqOijQVPTFLhb3wLqvxcB8zGISWWSX3F4u0bg0QY3QN
	rWWEn6kAPatQOFHRBsGOKonatUt7eFXsQeSozj9iQJCjtR3F67wVUNw5u5IZszC93REqLL+S8lv
	zVFjZGS3AKYf/rRFeWrkQgsCYs/dKBF7VKUTqlWuUGX2TsNQKxCHscRGt608+bbFpjB2r+tBYWq
	+6V+11IjAZmsRQJ0=
X-Received: by 2002:a05:622a:2d1:b0:51c:1b3d:fe62 with SMTP id d75a77b69052e-52d6486aa8bmr29582961cf.28.1786530351220;
        Wed, 12 Aug 2026 03:25:51 -0700 (PDT)
X-Received: by 2002:a05:622a:2d1:b0:51c:1b3d:fe62 with SMTP id d75a77b69052e-52d6486aa8bmr29582691cf.28.1786530350664;
        Wed, 12 Aug 2026 03:25:50 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b22784fsm36201815e9.2.2026.08.12.03.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:25:49 -0700 (PDT)
Date: Wed, 12 Aug 2026 13:25:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: hamoa/purwa: Add QREF regulator
 supplies
Message-ID: <acuia2fqmcaweqccck5kenborlevgcccffkwtyphqfl47izzyu@6zkwtvtqw5ry>
References: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
 <20260812-hamoa_tcsr_qref_0812-v3-3-dc7627169c6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-hamoa_tcsr_qref_0812-v3-3-dc7627169c6d@oss.qualcomm.com>
X-Proofpoint-GUID: NkmN-zXhoH9c6YrejfCRC4_9EXSxEqN6
X-Proofpoint-ORIG-GUID: NkmN-zXhoH9c6YrejfCRC4_9EXSxEqN6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4MyBTYWx0ZWRfXxS0NRq+NzqbC
 iLbFO9Pjx9p6GrLoxKX77wiElZoj5DQc9bP57mp3kyjRWIolsXJYggX/KH25S19FN4k67xT+4oo
 CJ8Xf7TX8F4/q9U/3zOYmkscLxsEaDZGpiRf9pG2Egbn+GKebqqoC/huiyzuvZJ5C6znR3A+r4o
 fV9U7tbamOUo71MapdSXZaBbuhqc5O3a/Hqo+TFChMFoq3TQ5zWL49bZNlwAJdeg+rPZdWA4V9b
 6swT3MVcJ4iYLBcGSaFT2tAXtK1bwSwAHUOZp1metveqcUyBPWgeIf2UGYIXBYiaMFyN4MkdJkR
 O31z2IVqQ+rE9+UiYKGASm0uu5l4s4VRlLvYVQBrkn4qfRidRCNOPxD51lImc9VWUAAnRMxBPay
 k/tXgpCV4tTmWEK108IIKf5Gi/RvSpQbXM7XwLt+TjoS3qxoFW1lONBuaVz9VVVH1PnyWZGwjTC
 qdMpO2J2OBZWx5PsEzw==
X-Authority-Analysis: v=2.4 cv=VcjH+lp9 c=1 sm=1 tr=0 ts=6a7c4a2f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=o07dIpAjZdj6OISZKn0kaw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=L_HiXLETPf_ozzabBtUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4MyBTYWx0ZWRfX9EjkqSK35/OS
 EdY8T5iUE1d0Z81GfSH9LZA69vQ6waG83vrLpYotC4ohaxxyI84eUIKhu3RN4C2oltAqN5ho4jA
 5m/MgkvxDd76YQ0kAosn46a6NxC9ul4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120083

On 26-08-12 00:27:33, Qiang Yu wrote:
> Wire up the LDO supplies required by the QREF and refgen blocks on Purwa
> and Hamoa boards. Purwa's QREF topology is same as Hamoa's, so it reuses
> the same qcom,x1e80100-tcsr compatible and supply set rather than needing
> a dedicated one.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
