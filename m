Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487080;
	b=XmvRwxhSLFA3xn+i8s/MWIKZYZ77ogN43Ud0yhN3toYEzxI28EcMmiwAKpqRHgOBQ+6g
	 GzFiy1/1puyIhdA8zsQmTLZu0AWOggxWHz+b1hXBRpxbN4zwZ/YgBVrYEtGqfSwAlwSjF
	 gYadIRBVDRjpT6S2AiMG03pwn4IFw0NBLp24mVnnUeK66XHYDvA1L/IAJhaHW5nGt32Nd
	 pzn9vgqSNZur8TfStdbYl/HxBh8WXogkv9/1auDLWxiUC438u/CMjjRn7s1RM9NN7X8Yv
	 +SPU9emKnGqjQ7UId1LP1YNd9ErWqYixJ22/oepsEsCHbHllXDel4qfrdxa7+H38ePA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2LGSwVG6leAos56EnJfcUfJ3UVLzAsF77/obd9U1Vhw=;
	b=4QFD/higrv95D9liHeILY++DZt9yJtARvpLgusvCd4dO4iKTm/vAnOuyBvscNRFCzIsh
	 PRTIWrypENwcmIUEpb4e6YtHFndO2MZD6KmZmbz56h8FcWIPMTuJsbO/EeVg/O5ntPnyn
	 xnhTtg8SB+uY6FzSJ8Uk2JPZrG2Ig4aKa/wtHwfzEbfRM4acgCM0TZfXf0FuENbFikud5
	 WHeJ3V5E1u+68djqbI4c/wFfoxB7K/y8MXMTDK5MMRSx2LMm5ziGYUj34EWwDDsKdVnRm
	 sK1U1Xd7+Kitjr8EszQR2ctbGzT+8xkQbIu2X5GNuuI9N+EGBKN3ZIamMxrTwciRZ0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ckOi/o0Q";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V5KkL7nR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE19606A887
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EE19606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ckOi/o0Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V5KkL7nR
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7iuhF126100
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2LGSwVG6leA
	os56EnJfcUfJ3UVLzAsF77/obd9U1Vhw=; b=ckOi/o0QcnZRHH99pJLvX1OL8aK
	d98Z8iCmRnBJ19fb9L4yy/spJsZ8xgqitsFBbR+FSlaspGSGBUSvh3t5OiiyJMkB
	xTRU2ykWt9ofh/+ondi48YcxdrJnqayxsUU2S1EcvrGcaUEltMHRFi33lxs8vv4h
	8EmPh7S35wq1r05pAtlVhz3bb2ag98ACHvtiM5vzH6X6r1DkbyNOjKEzxXXWR/tx
	wSvpskvCew/FLxpYeAzuynJaQDRinXJD8HUXsdU/KFyek1BYq+4PhNSeujOUwfhl
	aVOCiCk7CnftIg0ZhKivEctkKVGcBkuLhPawp0tCO2pWXLvdx/tXQoEyxJQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a09166-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:37:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so887106185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794487078; x=1795091878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2LGSwVG6leAos56EnJfcUfJ3UVLzAsF77/obd9U1Vhw=;
        b=V5KkL7nRrNrlfLwWnvuI6pwqih/x5qxtaxymubIDSG2C+tQFALtuU42h+oap2I8/JB
         slW3rgq6lLLoc/46leFTOlSt27RtXWOTPkaVQ7dpSLCgeS7BmBxZdHcId8+nV3J5hzCL
         fkbkg+1uDwZFDoDQ3Tuq7SUp79G6birJ9ACZ1ftDBHCfEt6Fl7ugVNiJDPjWI6VQpUwi
         7+SFSc+/Ijrq0VXEJWmWEui15ZTUyvhBDzSgeZuJRiazvXtlWmN/iC/3G1UFl8uzG8jA
         GEn/cAj6gH4WZXKv2DULZYXP1F05KG+Kx2P9ZG7XoHDuZhKNiEKH7njMx3ADWNCSYiXT
         IjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487078; x=1795091878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2LGSwVG6leAos56EnJfcUfJ3UVLzAsF77/obd9U1Vhw=;
        b=fyJupg8Pz4lthtQemLv8l+IhU5glJSNrYp5/bpWhI1pudb9kgR6z0w/M42wRBSAXHg
         u91tIRqHyDtJSQKmcA8Mgbt+mRGwbUGTGJ1oiqsv5rq4QLYjtea0wPgcyModNa7eSbeg
         SHacMD0Ml/Gftd6BQR6BZ/NPbRbp7Lo2K7R187IVXI9mohhYub6KTthB0BRtNtemYHKN
         2qL3Y3l62ig5pKH+amA+ZQXkEoqQXwkNSs4M2uZCAhQiDKCgf++qfYVzORUBUqOr9W4O
         q0OPdCm2yP8jeotV2K7WSjo9hnsklKlLvzf+W0bRgxr4GjqdcffIczgXTxwUTiRnI2iu
         5BtA==
X-Forwarded-Encrypted: i=1; AL+hErH4ZCB4kLUI1/KbNAWFdCiFqEdROKb3HXid5uj2LNFNW2YolEEjB3gOgdW7kSUvpDayf7D+NmxE8dTR6yDY@vger.kernel.org
X-Gm-Message-State: APuU4Z+62/mhsiu3g9OdPs65HCf5By5TTN7z1w53ATK6/vuiMp0/Y2ly
	7DmWMSM51r7mLjQg4anfQIJ+Oz5xUG9dP98+shLhXVXThY7qTmgM5qYl9l2JPst8RYiP87HVrzL
	XGaRhWvGtrA5Pcoj0luVrjudSkJHkz5mUE+7g0WOohwwd0M1O+gpyjgLUitMK3+3ukS3t
X-Gm-Gg: AYBFou3Q2pXwt+iCnERpYGCfvrSnYnc630+rEi2PL6oFwBz2BLHwIGhxOAvrBExwNMZ
	+DOHaDi6Ikz3Mn8MXfG2SVY2CMfIsM3pP/mrbVjJSZKWtV6FeJsCy22gxA6gHBaK42CjUR3d0Lm
	64KRGvojgx7545qn/4MLNYSF1TnvQTElxj6ew9kLdjxlwZ4FC7Ob+ic0vzPo9GGtXeqS4nFBMLa
	U5KLpMiTEymjMhY7U99loo2vwVXWAgBfk4trRGO0Z65VI7rmvc7HCzfK9ZycMDhukHRhtx8ITaD
	Qh2grbn6h2syyOIlKd0quN9Soj19NAU+/RPwvyen0mSfrWy2vzUxr6eaJEyQNenePviMtl8vnw2
	fM9iey5wbrqdQ9oYlw7cNTnWh96EWN7tn9B+gX1F1qAxjrTJn9rsJtGl/RRUB+XbCvZxBtkhlIw
	==
X-Received: by 2002:a05:620a:470e:b0:93e:c12c:f128 with SMTP id af79cd13be357-947b00cd27bmr911343585a.67.1794487078590;
        Thu, 12 Nov 2026 04:37:58 -0800 (PST)
X-Received: by 2002:a05:620a:470e:b0:93e:c12c:f128 with SMTP id af79cd13be357-947b00cd27bmr911339185a.67.1794487078095;
        Thu, 12 Nov 2026 04:37:58 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7b23bc254sm218990a12.30.2026.11.12.04.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:37:57 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Thu, 12 Nov 2026 14:37:55 +0200
Message-Id: <20261112123755.711756-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAFEp6-1dryYHtVme6M7opGHUen3vC+DyLJM8J1WKqVp6zwMWWQ@mail.gmail.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com> <CAFEp6-1dryYHtVme6M7opGHUen3vC+DyLJM8J1WKqVp6zwMWWQ@mail.gmail.com>
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
X-Proofpoint-GUID: s2NhYJxnHqmKrtbhGA42q7_mkNigfSCk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MCBTYWx0ZWRfX/v80nbZUe1SE
 i5ID5E5D7SOWQ/nwK2x1alTQGDvk+VjlqdDSbfFKb1NLgM0s8chKVwY4UYPbNqAnbLEQ8CcRh+8
 gUsXBobv9YOxMRM1g99P4Aq6LPM/KjT59fOPDkuVKS692WrpqDiZqydFh9X1ljpt1mBdtNu6E9S
 tmfwp+pCH/roAygZq8xy2egr+V4MZmutyzbQLi7Gc/zvwU+gVOJ4Z1MdhodyKY8C7s+Zi32zfhf
 a56SRfnme4iUzaRCtF2m2sn5hnB4B1a5DjOD2gpR2uX2cXJlZ2FG2QpFgvzNadSG2DCaGYmnfI9
 NqZ++C2i4tY4mJmIDgRkYd50bOi4nJjUuruXlMlu62cR3qZWRVWB+QNl9dscJDU5fYoU2p9sn7X
 Ue1LGeCjgtfMsF5LlZPj2qhoIgzFPILsmOQjqE0PBOU2UT+Q80x2N75JJ9gx9eNKp9qYpYPWQDf
 nRuBCk8iqSNbrlwk3gw==
X-Proofpoint-ORIG-GUID: s2NhYJxnHqmKrtbhGA42q7_mkNigfSCk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MCBTYWx0ZWRfX2GkAfZ79mXfG
 19wzmeI2KGqYwO358t6JAW/8krIUwdXA0nBzND4lStYQLJE3VsdQxnu1F/lhV5G0o17ZwYmi7fy
 NOO5ueFY4fvtYjFdZUiI+bg0rJ/nwDE=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5b327 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=FGaIqgoJOpKkMoVgYFUA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120050

On Thu, Nov 12, 2026 at 09:41:27AM +0100, Loic Poulain wrote:
> I find the clock names a bit inconsistent. For example, camnoc_axi
> explicitly refers to an AXI clock, whereas bus is much more generic
> and does not follow the same naming convention.
>
> I don't have a strong preference, but perhaps 'bus' could be renamed
> to 'data' or 'nrt_data' (SF path is associated with non-real-time
> resources).
>
> Similarly, for camnoc_axi, maybe something like 'camnoc' or 'camnoc_data'.

Ok. In the next version the names are core, data, config, cpas and
camnoc. This follows the core/config/data scheme from the v6
discussion.

--
Best regards,
Atanas
