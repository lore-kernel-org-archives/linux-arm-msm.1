Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098762;
	b=YbWnKgQt4WKs8xllb7/96aBD6yvlSby/q5Ljt61FPfoU00f/kHBbFfQY6y+hpHwnougp
	 hU2pKraUbsu/aGull5yLNE0/CgBfI/DUSHZpIHDK0jM75HaP56DaK/Je8UcKQRsrjx5YX
	 VdmZ394nwgKK+4ihKHG2SdQmN4+mIdbcaP3ferYgYpaP88Y294ZtgPLqcKiYBHhOBGbqi
	 6319JeaM1iBaOdeRdMyrXZNgcZ8yNt/t+nDDD8vZ05thfBPlMndUdHhhBgbtPwPbuDOms
	 hunX0aCQiRtcO4R2N12og4SJ06hYDB+oaS02yuxMIIYsQORFE+kIMuJjuzuwouDKxUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098762;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ykAqLoi1r7lMGwbeK2sUFMARw3wZakPbFC2fhUJSl/o=;
	b=KicdQ83K922Ay2OiCS7UDc8mF/y9a0t1nEIqT3XoUfpaYDQS/K/jMtJFLipvOugUdgVK
	 0pr/tIFznZkh0JM4FHOfMwxt1kRs4LPou4SI87WXUZi3ajlGeBgLLunSM8MkTe/SOLo5q
	 hgYGePbV7Z1Bo2OK4uhoxBI9Eryc85EraBdUAiqqZL6PHtigJjilrf8fzkLGGXOX+nyX0
	 lMY0eAsuJ24MZxsAHw1y7A6Tpc/PUiizUgW6XUuyitGj4hLsqqXOCi5XRSYoCMy5fXcyU
	 7DYfohL81RzkTM/hALqgMLSGzzVObTKnUszd+SrG/bJoXxujCuTJEjTAUpV2Pm2SGqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OMBgYIPt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hueOEQT/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C401606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C401606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OMBgYIPt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hueOEQT/
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeDU8433009
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ykAqLoi1r7lMGwbeK2sUFMAR
	w3wZakPbFC2fhUJSl/o=; b=OMBgYIPt9T08DlmnRfVl6Gi+DMt6ReICnWuXECkd
	MBE7LkZ0raB+jlsfl8WtH+h+vzcGxO9v8OVBBodYX/wiPt2R/aOn9n5LNav3++IP
	W6Wa85taDipM9pgkzo1cjPrwGnvXJ2Lr4Vih5YOtu1ZnkUW9bSnnVd7DXalmFbi3
	Zp1YXpZuTlCKjZWlbePxsCCTglCpukctIPvppBeFpqjmPc1AWHq64ek9UMzqqDQ3
	BKBLgFL8YEHTHg6ZOu+SUYIGTXEr71oojboRRdLYw98rH00DSTAPiukDrjx5xc/s
	ZTJ0QOxQ5/rZfPoLR+/zcD2GrBrvaFVCZSIrSEE96WdwyQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54ke4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:59:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-534f3fe0236so88372201cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 03:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098760; x=1793703560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ykAqLoi1r7lMGwbeK2sUFMARw3wZakPbFC2fhUJSl/o=;
        b=hueOEQT/1f8F+8ejN0tfrj+PWmvO8rcKLox5IHvLDu/0azAYz84w1OuyRUxs7ylFA4
         2NBwl0ELm2a/5JONVpDPLnT22l/XbT/Ro1hxpUrvF5QuC4IWcX3W3wa/LX2A6Hh1LbAo
         zFIsWV1IFnHDgxVECn7Aw+aDjKcXGYnowOlxHqpoOdvSvh7ImFKgOlzoLNtav0NNZPfh
         tO/ZIVg6DHi47JiM1tCQJ5yamnTLuDw5SgnG1bpP9ytEX23JWNXDg/LUoUGpNlWwELa9
         45t/VZRAVoGNF34CRAJqiSNKQcN6l9aYTMcJKHb1AsyEeD+pF5XqLICTyksRVhSqfYqY
         hSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098760; x=1793703560;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykAqLoi1r7lMGwbeK2sUFMARw3wZakPbFC2fhUJSl/o=;
        b=ROoTP/e4uL3QvnMyV9emuPIgRGqLeG55b4D4sJh5m46m98q1WMjQETg2IF/F7oYgeR
         ZURsQyPCbJ8cvUaZw9Uxt77nVWIGHr0zKooVdbup74oKCpZg6Q8Lkrq33FVM/LIjzt7H
         SJQAdHA971OL1usXDQNQvJQV3fiXHRqqFYIR6/Y9gXG0TTl/nKN7NYxto2SREdHZA0Lm
         uNnmzVyRcdEUpGesMbDrKDAE3IN2zdL6p5EN7OsGwyQkYuTln4ot5+7rMXiWWDMINAuO
         NqPMTUjwqQIkUcAtD3zGu8st6kfKcgR816g7Tqm3h4hIOqR5y2RjX6VS6zaD3ZEj+rlA
         80pA==
X-Forwarded-Encrypted: i=1; AKwUvBwLe4yBfxTYw7IuicDbM4KDP/C1xn9sitFJB4rGLRgtWvWrLft/XAHSxkxsRVC5fcWy16G/ukqQCcmi2gxm@vger.kernel.org
X-Gm-Message-State: AFq9FYLxjAQNIYOJYK6wjd4hZtFtZxh5abfzqTW/z6U2tfGwBTI4xmwy
	5CdiFybAOFOntArbqUOedp/4upCCPPtiQgNzEvVwNADnaY76ico0s6TVwKJJjOEqKgxBu4xc0C0
	YbWskzCMV/q4TD7KyIgXySHEXKkhs77CjaBnN3qlpWF1r4/EauHKkSiY6mCVujzsuu8yY
X-Gm-Gg: AYBFou3Yvg5ncnrV2OUbX2DvYQXqLY/cN2IHpe2MCUCvp21REeLdTuBEY3ZcWFV5kKu
	fV+frNfr7/mbdu8LhvozUQH7PpNUGPGZkeiqpBz54SSyigjvhPQ+z3nxw7kzFvS/GQrBv1Pj8Ie
	zM4o3AHWPhign71gwESboJz67EnBGdNx5yCrJzU2oLKfPpRD7ec2b6fT6Bw4x47Q9kMk4sVV0H+
	yujTqYS51TRtSmIlVuiaPYHLhfOzrww9YbWYTClOs+/7njxZyZNXNmkpjdFY34b+FmB3Ra5Fq2Z
	IE77nRzGcd25v6wWGQwr/84jt3XOwSHd/27akAUtIGA2LBbMaI9+nsjQnGJlRmSWGUplfqNj2eb
	BROiqthNCFHgy9rE0
X-Received: by 2002:ac8:5750:0:b0:535:33a0:520c with SMTP id d75a77b69052e-5383b350840mr170740261cf.3.1793098760171;
        Tue, 27 Oct 2026 03:59:20 -0700 (PDT)
X-Received: by 2002:ac8:5750:0:b0:535:33a0:520c with SMTP id d75a77b69052e-5383b350840mr170740191cf.3.1793098759624;
        Tue, 27 Oct 2026 03:59:19 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a5ea0df763sm178309875e9.3.2026.10.27.03.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:59:18 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:59:17 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sm6375: Do not mark MPM as a
 power domain provider
Message-ID: <junlahp3txwwj2bs6pi3lhlvidxcp3zgvszb74xbciv4n4ymvo@tfyhqi6tr7mz>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
 <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
 <114418ab-dab6-4772-994e-5babeed72b65@oss.qualcomm.com>
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
In-Reply-To: <114418ab-dab6-4772-994e-5babeed72b65@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX/Ss3t2SL71+z
 T6uIlroEEwIfIHe5SM/10gbHEiGn3BV60BxYgIfzGI5Y13cwXlubux2DW8GH+NwIYZjGz2BUKYc
 wItj4LIgN7i6FZsRsEIc8qk/T9o8JQg=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae08409 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bcB-52WucOyEF5bHse4A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: c5bQObiL1jUB8Jlx_83fSfKUjr_oegip
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXyDeE9diZMC+F
 MfMQtTksGTzQfdSUzJkMCicZUAJZK9VOM9VreZm45QkW0/BNA2Md5E+lEZHZw7FSR02rBDJ8AA4
 StmpgiADDkCaE0Cz7IFj8vLe+UlZtrOqxXdEDOPocUbsmc6VOGlbzdGeSmtKko2ns+zCs/qKL0z
 88hPMANCqZJBCWVwxiL38bAG2k9fEkN7eq198hmXrnTUIGajsaSJ91fHR3pdV9UE5Ss509d/z10
 k8HBP6OV4eVg0hWaB1CFUVsfaw06Eufi8WoVeTzGI3axr0PkGZYn+rnd9iwussj3Q35KlH07PhI
 7JgK6DtcPWW45UkAkJt1etd4hYyieHlBXcxSjlQbIoCxIzdsz6+78FT7Eywy82eeyjFMqWFPSz+
 agCUNDYkmB87Qq8A1pvryjQJHqe4IHDjo1iriN5sqTbP/u2rT+6qA4QCCNuIWHJjVmC5ocJLV+i
 +8U2snybkM3ZZgIGj6g==
X-Proofpoint-GUID: c5bQObiL1jUB8Jlx_83fSfKUjr_oegip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270043

On 26-10-27 11:23:25, Sneh Mankad wrote:
> On 20-10-2026 18:30, Abel Vesa wrote:
> > On 26-10-15 15:25:22, Sneh Mankad wrote:
> >> To make the MPM design more logical and avoid probe dependencies, the RPM
> >> notification is managed by registering for CPU_PM notifications.
> >>
> >> Remove #power-domain-cells property from MPM device.
> > 
> > Can you elaborate a bit on how the two phrases above are related?
> 
> The MPM driver now supports two ways to handle sending the RPM notification,
> either in the genPD's power_off callback as power domain provider, or within
> the CPU_PM notification framework. Removing #power-domain-cells instructs MPM
> driver to follow the latter path, which as explained in cover letter would
> help avoid probe dependencies.

This should go into commit message, I think.

Thanks,
Abel
