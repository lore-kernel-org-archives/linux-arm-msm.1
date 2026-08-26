Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B05F3A5E8F
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787734618; cv=none; b=u+eAs2iDhozR4JEeiUhWpzuTuTSF/znMmGhxM17VP47wtY+I+OsIRIoHFl+ITArOZ+CcRNTQTggQSX2lvCKuVGvRHoYqsJ9niyIiPDsNRJQwayodzkLTPxZRAsf/QFSMShWPKR4YhhWqh1Dn8aTOWGUkeSYhJ4XFYAZInKZNELc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787734618; c=relaxed/simple;
	bh=0Mg1LmfUmbwGwuRDDPdkh2BodtU8yrStOlEwkv7x5NM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdaXqCsO4M0JUuZggAyjvy0uxZd3ehM7GX/kTUvIz9fTuOzpJ1TkncgkOyt0a3PuSWL6vSyDy7jwqiXmK/d3l20QX+qjOHBpMVkgCl36sQD7Z9zTTDhojVIciCyX0Ub/XGW4sSQEqDMPOwy6hWyzKBs6E+CL7WQI9wJ37GcdjPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZ6t9/oy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOB9KooA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZ6t9/oy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOB9KooA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q7MngP1261046
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=svX2qK4fPMxxXoNFfe8mT3eb
	lYJyvxB5cN90dNFCI94=; b=XZ6t9/oyvjYHAtI6lAkPTJCsmAaKuPK+cCIA7neI
	qiE1zSqiUSvZpYoSDAtlFidnYuhEfi5K5aUZOi0Ut+Srwc6n41A0h15jIOoBNmq5
	U/X4LhFJ3WrP4HWkmYMnx4cL0IfZ3XEOMzOCh0RegCIvRKP8wcq9cGPznt+PeyRO
	zDiQ1YeyW74zvzdILvwJ4iwkyCMJZYC+f4MpUCUwpTDztElzQu1/gEKodlmjC3TL
	5hHZK3ktVjAGdJy+zDgN618GWZXin2L6CR+thg+D7v2RrUuMHIl7TFUUuC6s394o
	nkRk9x5xivMM57X2ofXLLDy85K1GmSvnC9gW2U4HsaejLQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1rcd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:56:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90a91f4c6f1so2964656d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 01:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787734615; x=1788339415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=svX2qK4fPMxxXoNFfe8mT3eblYJyvxB5cN90dNFCI94=;
        b=JOB9KooAS+pxzgz+D/B9kqWYbNj/2mfhTdIPO6890xO0tBi2d2I8iUOUcB2mDPcZEC
         d3cBzUStVm8Laus61p25FdTkxWrFeQiSe12VJQvxjGwRYRyx6xIR+eiDF6VkRbPLfqpl
         ouBMrpu6SivSJyZPIqpwVKjCUSHjioCTNmoC0yEetKgRPY3Xl6VtllhazZGtTn5PWduN
         XijGgrO11gO4n99u5nU9Kj0eHAqFbH1gPxtLPSWB3UcuGhgshRYjGArFvrq6sAoDc+Ri
         1oAHoPep4puSB28UW5Njnd3AyTNnYoFYirN7xNIngB8yQl/bUYeTSXEEbCoxkohCCt9r
         M3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734615; x=1788339415;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svX2qK4fPMxxXoNFfe8mT3eblYJyvxB5cN90dNFCI94=;
        b=gvL5XLx34KbX84bpIDVKW3JSdTLAW4NQGwA37oyQ4cGjoGSiCIIJugZ83PWqzGJbjh
         UyWuqw1vpae5A6QnSevHeW2NS30UKlvcR1884afa5bpyxnWfPLcskD4FdXeb8b8XuFlj
         eooczOK1LfwusAaFJlIqEr/Qj+D5+fihUrtzUpo9fn2onOVDwaqMlCEVZFvoFEnlMitH
         dQSUwVYRJ4c3M2s6FnTt8DQtO0nnzWQBOKUSBIvqHN3f0byK1L4CDPWHgVD40NIGD1vW
         X6wqKXoX8bwMk0dJtj8J2sYl5h50T41M1yGWeZKAhI7WqeRBQA7mSRtgPWI9I6N99fWt
         jZfw==
X-Forwarded-Encrypted: i=1; AHgh+RqNDGtrOXGvPiAx5jCid3RkmHD9WML6HQpJ5bAeaxvjLq+AegIur7+JC8bE4J2XMAXQHGTgotci3iH8I7Cg@vger.kernel.org
X-Gm-Message-State: AFuF++llMopiCdPJVuicbm7/ds1yspSl4iY7jd9gjljG1XmwR7M2ExCc
	hUiOp7FTXNqbQiD1HJ1/MDFqJ8zuM0ZoF9oDmNRefd0Ue4dox6D+n1v8aD9982M6boal/LzwdUF
	CU07enLIgo5ped5zMNHFrUO5q+tJjPpWpv4oEc0v/+3asUNJ0HwPOHth7yMmeGDfRgI6a
X-Gm-Gg: AR+sD11VoEtkHwsLy/zDaOFNMul3+o+05Mct688CH6aRiBOAY8d6f/3/Z7NSkqCIiIq
	9WzHtaFuJdFr/N3WlkrvONe+0x8IxLf3Iy8Y437rMBO+SPVJ5yEMaxk07zcJeP7X45WHkU7LOC8
	17I3Kh62YZtKGS3poqTCynmB8phBAJkwgEeo9Qp2AVa9RzOhcQj8BRsPZ2fn/0ToY9q/8aCVJEG
	jNHL4bYIixyRt6EBgjDFrRbQt3NPRtR8swB/xXnktBcIDCOCctnc+QQsbwMzg8bszodIVntd6Pc
	Jto0wbFUydZENq4eDSBToF4ePi/vMl7VeJmf4qm7qCffLkZJwBup23DUJ0KyVKQE1gUr/axuK0c
	tIz+o2kZqeQS8
X-Received: by 2002:ac8:7d54:0:b0:52e:3969:79ef with SMTP id d75a77b69052e-52e423ed557mr48995121cf.41.1787734615144;
        Wed, 26 Aug 2026 01:56:55 -0700 (PDT)
X-Received: by 2002:ac8:7d54:0:b0:52e:3969:79ef with SMTP id d75a77b69052e-52e423ed557mr48994811cf.41.1787734614620;
        Wed, 26 Aug 2026 01:56:54 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8b5e5esm2887159a12.4.2026.08.26.01.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:56:53 -0700 (PDT)
Date: Wed, 26 Aug 2026 11:56:51 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop redundant qcom-rpmpd.h includes
Message-ID: <pyg3ggpvrrfvht47vk2lky76wktrkf2loxxkljkbyfqlxiebpd@kntau7csf6gv>
References: <20260826085323.539860-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826085323.539860-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: EHtaNgFa1YX7y8W1c5j-nHTgV0G2JWKO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfX/w5hjAP9iNhn
 JRXCVH29ZI3VgLTcDnmO2+htgbKIxdx9vUKSjW/msMNJmELowM/KyV4SdUiH0ADoOfe9UVdNNtT
 s661R1H3yqHQHx0urGiYVsnCgdj7hrhdHrhkuoi3ejeFn8OqkRZS1RfYzPW39TJnOGK3+oXO8d8
 rPhpl8RjoQcLFk1l8pKfk9RD4OaCr2uWW+Ddyq+P1GkxFc9mw8EeEBj4ATzpm52ROxDcyKZCBKl
 nmBeVeiVXf/MFy11CHtOYBa8S9miEkZjf25y2cTIs7xT7/s8UTe+be/jCGLhWLHy+10TmQN9fzt
 Au/z+HQTwBtAbxHSyDw7CTkwdXmdMzmjhajXPA48qgnbDItUl47+D5DBTELex5okuhfCfcwY2qe
 Sy/sWEo705AKbl3/C4aeGO+pF8bs+Es1i2X4qpDXNPRDJqWOzWDi8Y+diHbb/+e9gCR/iBRE4QC
 EP5J4lPgrWs52vX0ZOg==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8eaa58 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=N-HENkHhRrIbFrF0-YsA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: EHtaNgFa1YX7y8W1c5j-nHTgV0G2JWKO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfX2gcvOb1pOBCK
 MCj/4lYjBk8VvIZu/euZqweA01FklkVqjETYO0yaQj8ckBeWlYJhuAia/LPqqLX8GZ6DMWNelPe
 +2hdGYKHsXn6J/SHE2Mr9kUsEpsJ5X0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260073

On 26-08-26 16:53:23, Shawn Guo wrote:
> qcom-rpmpd.h already includes qcom,rpmhpd.h via its own #include
> directive, so any DTS file including both headers carries a redundant
> include.  All affected files only reference RPMH_* constants (defined
> in qcom,rpmhpd.h) and none use RPMPD_* constants, so drop the
> superfluous qcom-rpmpd.h includes.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Nice.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
