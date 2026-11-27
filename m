Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758346;
	b=Ez81oZlpRaD/QOvCfdwRpqIlLkgacuC9QZh1mYI1Kfp8qsdCUmx7B04hxxxrdWNGiQIj
	 WGXlgpywmY/fF8fgyaZP4HI/1quzXyka/qtPrjAa5n/XdpCJnW6OhsvmOh+vGmt0kIW7p
	 Pw5MY2addJ/k9Al1n6WSSucjdbwzh56VgDBc7nFwccSVaF0rGI+bLJQBloc4zoGCkgWg/
	 iHxDT+wabqv77o9hwjc457ZKoergXQwdp4hhTXeAxigajjPpmAttpdCN4XyngMR6+UTgD
	 t52RY+vNHP0VwcTM5WAGoAAvXfS7fDahHMs7rwEdYTEYv+azR7OnA7i81td8OZBU8Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758346;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hJdEygyyrDZKJGb3ntvQ0LztTs/6r0XSlN9gAYA5XxE=;
	b=KstPkDFmfCbwhk7PgO7zVw62+F2uHsYwGFIgOJQKWMfr3N+jsA5FXWOe5URjYIhK7HA8
	 j7YfWB0ovIy8lXHUkN9G5oDwW4mb3bGzb3l25hL0bfZAlBOEBau2M2MxZFiZteU/PwGbU
	 xB2UE8FyjUYiPvG98pp8VAGn4pM45tW6oCGRfwHLtMxn0NnrlYsnH3ia2cbtO137rebr0
	 //RwBrJIKxtFXEfDTUwl9G7SbKDEV39kyY8LCbct7LnZUeR/r3oCBgF8P20oh19ajZKpy
	 yVKd91NeGT2lPKY2Q9jdzNYtVhsbA05vSkFaUtJ+aUmNX/H+ZLVFrh+AaYgyifb1x3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l9fEWqg0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TvAEwP3g;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13FC606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A13FC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l9fEWqg0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TvAEwP3g
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJw7g43340036
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hJdEygyyrDZ
	KJGb3ntvQ0LztTs/6r0XSlN9gAYA5XxE=; b=l9fEWqg0QdnD1tAWX42PLnHSY2i
	yFTCfIUsuD6P7I9ypbRcnFPAFNC7KCaK6u4B/pk+g/r58I2UHeKnUf7Hl3zEr/+r
	SfIMH7+2AFypRsxAFi4lc/agBayNRpJk0z1FIeRIghJSR2GXwf3RaHmh73VBMot/
	MeoFLPGy8PsQyWKOloHJK2mavUn9j2B27P4CY5xrd0MfLWyhMyiYzCrBILBDDWGP
	M57hp8mpfhx2d14JggeOQpbpRXzN1U6pW0GcKOJ22Hi1EG1bPsc90/8/GRyD9dVI
	iLllkB92uGQyWPuKm9ONTT47DFkMX/4ZwNQ+1MUyQa1rhP6pgfSYU9aukKQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqjcc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:45:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b4ca90ed93so3846922a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 21:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795758343; x=1796363143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJdEygyyrDZKJGb3ntvQ0LztTs/6r0XSlN9gAYA5XxE=;
        b=TvAEwP3gVAPEPAO5kwm3hANV9BjEhTz3UA9JwczWbCmD5eBqzm3IF/dlW+vMqD8UZq
         g2I8At/ai+sCw46SqTIP2uHtKR+g4d3kLk09KQ4r/eAM1tnmzD8/1yuIerATQP6Xa0hN
         vUNbRUm42PEtkDkfP4qPwYZVEr/GfPjalMMSRpLRWDSgKXVQSCCjBmNBZzVTFtb/P+Zw
         yr1ABQdGgVa5s+PL31gpHQmZXnjeeRTD7Xx/Sl5UDIMDDAjX3ALqSskKIQCrHc9HRX8j
         nJfxYI4ZeIhZ+OpSdT1dipDibEakDurpdiGGYKiACtuKDdbrLyKouuYqybPMwPxiMUVW
         q9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758343; x=1796363143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJdEygyyrDZKJGb3ntvQ0LztTs/6r0XSlN9gAYA5XxE=;
        b=mVl32jtkJrVT3Zf4Wib7s/gHwZbLepUWdM4jbgb0yn/43qWjjeibtaSxjC2B23BSs4
         qnG3DUTgF6TlI/OfM1J+jt1LXGG4vrb2lLBeGRblFLFo3agzYxWR/BMkpAUOTd7nzcnd
         BxDkXVIjkTc9589kF38b1ebMDhlQUY0opRCI61xXbYV/tWWKHmf8X2PClnj3V74USNBP
         zptppjKncbdIG6dKB3H9vrD3BEdXibuZfdcNAQm4B0r0BJKJ0oVzoYUnTZGX++THJEaT
         Mx/QX20K/GgrFZPbvVKwKM8MbBFrqjrsBU6U5UL36sTKmJOAVmEY4wdwQOr4zKJFsKlZ
         6OwA==
X-Gm-Message-State: APuU4Z9hk0f1pf0M5jFx46Wk4VrWz6VTV1lzS3pUb+aW9VgdbXzdi1eM
	swSnzU2OY5IVzbkzLd7C3WuhNHTh6E+PEwaMhU6rC3QbEpqf3J3Y1QS1OYPGyQ5nySSGKTvQ03G
	wQoAtmU5khm7fLobmI7p3Wdzgvo9620Amb+Pi+ImAsthANv3bW8YDt31ea2DyhuH1f9Bz
X-Gm-Gg: AZFdTZdrViHUWuVFm6ichnNH/7IG3ydbZDzHNuTXyKOnDXnaPeP7pY/ihjSasB92vlf
	k02aPrNwRZ294JRX4nm4EDa/K9BQ9fds4vONGfLlb9+4DO8eSSuRTMES9THRko2f+2pMxg5H0o0
	H8Us3te9T/Hisf0HZegr897JoNLCHOgPCb5yzZStE1Yp2omrxKSfGGF6ik8w76Q+rlmGnV8z7V5
	S35GCzVxlhBxBqaw+Cl2EoANasm57qNrWPykrbxCKMHOP4Hush4yPwXvGNXoIFAuWrvJGoZMOzp
	6rHPkx4Ntb6yOSTwFKRQWWcPtDewGmJvBFaS0LaK0V4BwvGaaTQsoJ2reu6uhqkuQQa86kijPbH
	7x9VuOBgUxWK5tY9NHfYObzmoz3C+3e1C6wMDuMwcq+pdRcSZMWOlqFMVmLeYzY0THvHebWI=
X-Received: by 2002:a17:90b:5287:b0:3b4:402:b3fa with SMTP id 98e67ed59e1d1-3b41c8fe1edmr22183511a91.18.1795758343074;
        Thu, 26 Nov 2026 21:45:43 -0800 (PST)
X-Received: by 2002:a17:90b:5287:b0:3b4:402:b3fa with SMTP id 98e67ed59e1d1-3b41c8fe1edmr22183485a91.18.1795758342617;
        Thu, 26 Nov 2026 21:45:42 -0800 (PST)
Received: from hu-anane-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm36124198a91.15.2026.11.26.21.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:45:42 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH 0/4] misc: fastrpc: add HPASS domain support
Date: Fri, 27 Nov 2026 11:15:36 +0530
Message-Id: <20261127054536.646943-1-anandu.e@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125-fastrpc-hpass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com>
References: <20261125-fastrpc-hpass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: B3kuvEhKlIV0Fez8VakZk4X-mz9gLgTt
X-Proofpoint-ORIG-GUID: B3kuvEhKlIV0Fez8VakZk4X-mz9gLgTt
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b091908 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=HMxxIxWglf0TOBfGhZcA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfXyDvY6XBLG0jA
 Oup+kRpqPultSrXxjhj4YbnPlFBOD7pcSJwqPBcT16yCysyNrPDZxvSl1BZqwNyRhxCr+BPZ2CL
 xeQgd2ZcJZjxDLbhfvFgqUP4spdj7zM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfXxZEUWcoJmBUg
 UDpR+RgpVCoyZT4nBWLd8CkOgyXEdSx/n2cbr0cdc1P23e09c6RQa75IiO4euhhSoMHQGY99ga5
 fyUT8OhrUwbkltAnOPMGyW+SW8GIyu2Lu+XrhY1FXK7YXQQmauyTbbkZfvdsKM0Qvq4xlDu156X
 MQfb3fFf0il+aDMUKgen/MxkfUPzYosx++yRJXKVoiqTAhk2KkiXlfxfbnos4FNu1CbJcLKUI1V
 TlGbourD5Sq0WJ43bZ3z8WbNNUB6qNy3M4IwyYUrx23q+LdR1rjXWbuQhbOIw+X+usAweBPF6+l
 L9psnEumeQmUvPXSiR4qDS+LerxpDE2Qz+p9oYHvm24KsA+PgVQ/fAMJKqTsmJgaP8v4dpMvrEn
 NFaENd1HsH+QiminLDCJNGQjKG+8IkIIQ32UtbplTEW/t9CfPz5wMqJcjTooqMUq290KBqe4DiB
 o3hfRUaZ79i3SpDiXbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270022

I'm dropping this series for now, will revisit later. Please disregard.
Thanks for the review.

Regards,
Anandu
