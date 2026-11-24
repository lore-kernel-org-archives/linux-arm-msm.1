Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515802;
	b=E9oE+hkjSiY6IVCMBnhOEpHPuGB3L6rQoy4eOueQZVdKTHhrthUoOnkqtuUp0pItfIad
	 IzRozwTDoi4DqT06299xnKwFDsxLJxG0N0Yxeu6gYobNkP5oWRMvRdwf1wom7ynHZN78S
	 Ymgze9fyMau3JsDoTWDVB5fk5vyHa+s45iLtthmcJseAPAbhgCeBDLSkDxgWEei6UyBWM
	 nMWQfGTzTIf9mTuTSUg1x5exhf066iDZLP/jEPjPbN2JwLDacZ3AcjfPSbdyAxdRXJKEv
	 4BbHQ3sDBaeSwhxx4ZT1aSDQI25SSGuvGg/c5xtVtC+2Cuc8jOLQ0JuE5SYOQH3mJxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515802;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2fQNmv2MnA8jx1BzEazbxTqvaPaImMJgZb7CaQywWkU=;
	b=PYLNYDXGT0zCDexylQVQHUfIjFus/aiEZ3sD/NclaSzmaRsHr5WZ4AQsED9+A4vbIKRm
	 X9eXem9pA7FZYdKTok976ueV7BZihf/Q0R8fDYVR+9VwQiwJywL7CQ/2diBjSzffVR7sy
	 W6QxhmGilSi9AWmiXPutOgPOcouujS0061cNqPXq93GG9A10gL2OOcs082ihMSIGz6EFu
	 l9o4mOXyE8uQLJFvJHzURSf87CD4J8+k/+OOmIb3DfTle6tK2/U5MlbdFgb9uP77fzrOb
	 zwiJb6fU6Z270lLjKP+F/9Ivybs8rJQUqxcBKWX8JHaG2JSzZiT+ty62fmQMi38uacg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ml7LMilt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hTmsE5uN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A1C606A326
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63A1C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ml7LMilt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hTmsE5uN
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8X8TA1598262
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2fQNmv2MnA8jx1BzEazbxTqv
	aPaImMJgZb7CaQywWkU=; b=Ml7LMiltCJncDzctmpREyOgNpLM8VWutEjLBC8XG
	F96Pf7oPqmuQzPabf3TMtiBprar+icB9tJrAXWpfYMc3qYjiEliC4sh1JsDKA1pC
	nwRue456CG/s6wzPW+sAJmpZGcxWtSO52fDYe5onUPFmtgzYNZ5H2l2beKJ+0IDw
	on40G+N9TwWD5fF6koifpC3k/RqBbR9dOmK/6OU9qG0G5ObGPpvsQ40P6SWztwE1
	21l6Oz1IyFp8vVoKntDvlIdEeEnc1hrcwDxilQBUuBvR/kgTTqXo4Z/yQFVnNM/6
	xbcWuk/di6CNxO1dCHcyDPvJub7bj2zayKEdljt2PuLduw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqk47w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:23:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3846d5f54c1so5465847eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515799; x=1796120599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2fQNmv2MnA8jx1BzEazbxTqvaPaImMJgZb7CaQywWkU=;
        b=hTmsE5uNqK+4zartCrrHvMu5pELsf/34GfdpAUJJgVeUq6eMNjBuwNnYEmAiX8UyZK
         Zu5Aj2dZoIdbxrk9D535L8RKhHt3l/4pymBxxKS45OTnHLW8zvsrvpvwvYN0jYNyJhp/
         2twa3Ed136f5yB+/kIi4hvHU5I4MiMd/9aHsLkjBAyNhvrcJCNOmirZKGLQw7mAByZxu
         uUwCWraMUfjClP2Zd5oAs51yX3cle/JA871+i/eqMIbLodpW5NE+crpmYCOIfuDUB/u7
         CVurmdXh5k1ezz41Njkj4FAtUL9WMOKk6P/3kj7gwiBPadBRhp9Jd7Otp40L5sGOXPVw
         7ETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515799; x=1796120599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fQNmv2MnA8jx1BzEazbxTqvaPaImMJgZb7CaQywWkU=;
        b=uCFbrSzpm34hYsa8NlhDBtHPYnttPsVd0I+Mnh00l+QJryQqKLeEaaEHlkckp8HkGn
         DJCKiQdDEsB8PFiyAxzWmiGNziRpPDSIG5G/Ney5Hp7AUV2yY0gurFwCySZl51LPsOvJ
         u6OgoFrYZ6ac1MFKQjARV8Mrp8pBWjnSFaX5I3deQcJ05OPmR4fhRNYPllIQxQ/Q56fi
         qLCZnMuG0mt40MaIW5bQhZqOTzS1eyYi0Mr3xwGUvqTIp0AwYKg1BtjObg3kzGEbLP/Y
         sSoD/FDrI2EYYsELlkl31hnkNBzUtUUzoE6rjZBqiwDDe/ifUNQxgcN8/tc6CZ2Yeiwi
         Stjg==
X-Forwarded-Encrypted: i=1; AL+hErFNJC2PYRLtWPLDZFF6QsTXMG3fsXQIe8xUXNHOOO7jIApPgsZ0h5CH8s3Qt9zmJUPgZea/F++AuOCvtXsn@vger.kernel.org
X-Gm-Message-State: APuU4Z+R5Ztj18dktSg7epzpszqGlWfFwl0H0s9RXuZQq/NajeBK7UMy
	nj9xixzH21T6FQu5YHCHOofStudMuwY/4/2h7ouIw7ldlDExmFPF82nMofYQjDXM75V+wFcGx5Y
	xi3W4+44HpXheOk+e1U7g/QhpOksGrbmQOgmevqqtmKQ4ZLFKfBO4hPps7Mg+VpXF6ZvE
X-Gm-Gg: AZFdTZcImGgkChS5RxL3dSeNYTHWRl7+0BEGCZNJeWktzmvbnLl/j7h20Dw/cDdrNwN
	Bhs9E+9xlp2roVQ9Ipl1xQqCvfwsOzPC9ZcncVHaXy82TuiJKgqj2kkGZejTyKfY4M4WVKhnZ7l
	RnR6K0oCAOd2jfH/Ff6rtsspU+43c+ZuCq45MeU72FTvN/iWTf5rn0V9VHzd3bNwHnX/E6EqYKV
	eypJJ9jMCizYIFW+QWWXCHKt8OMH90pLvbpVpQ/RVoQzwFWlCI1oX0vaudUThHilhiFNgxLjmu5
	LUygvOcK0FY+fKjZob5s5xrBN8l2UcEAMxFbkPJn6RRmb/1xFU67GFEwZUZ5RHxjAuwXsyFN/bR
	RkjBKWDzFAmeBHId6N0lUVh1/ASzzX77Bi4BauooP8KGghYgHa7t96lHjLzGSNHsgD5/zscDq/G
	IU
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr7919256eec.8.1795515799033;
        Tue, 24 Nov 2026 02:23:19 -0800 (PST)
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr7919228eec.8.1795515798355;
        Tue, 24 Nov 2026 02:23:18 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm40252277eec.13.2026.11.24.02.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:23:17 -0800 (PST)
Date: Tue, 24 Nov 2026 15:53:10 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/5] usb: misc: qcom_eud: clear the enabled state on
 disable
Message-ID: <20261124102310.q2o4ajmvbqddizmj@hu-mojha-hyd.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
 <20261123-qcm2290-eud-v2-1-9bfc432dee07@oss.qualcomm.com>
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
In-Reply-To: <20261123-qcm2290-eud-v2-1-9bfc432dee07@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b056598 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mksB-i68-orwwBDzz5QA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX51swsKYH7+5q
 aSi9GnUXdD4oVx/3Sl0B/FQVp6TVTYwYmGFLpvWyJ7EcxYEda8ZYqgKGHu8Z0zfV+aoLo7G0iAz
 cr7KRFPj4CloJQgMCoaRrmjOjtBiCOLF2BIcoCV0lbeh40tqA5Hy/M6FPXYz3rgQxJTwXT2qJqG
 JF2kqEbpSm6j6WQAoic1PTCj++Rpdj+nrNf16tj4Ap9ASAVZgCKiN0mm1vZdx3reHsipi6cdW98
 idaPvrHCqlD2l+g8JLiN+mSD59LwI7UhJerpWo7r8OLxgNPUZZzW+6kS6ibaikRSuIBhoZe/Ef6
 aelTVqU9Rsdu7kMeGdfKK0qxubjbfsy+QfOG9zH4ONi7vx/Yc6pQu19qqW771jGdiPokHHPG5xX
 ZdmTFnY0TT2ouOPMDb3GLmnYTFVU0u3KJTeHGVHZKOCK7JMHWSl6uRem5qmfV/VXDfnOHDNs9Nr
 033Dxmc7WV7ISRL2Epw==
X-Proofpoint-GUID: RSL8IsgFw2o_AhfgXv5LIWIIdIH6bjrd
X-Proofpoint-ORIG-GUID: RSL8IsgFw2o_AhfgXv5LIWIIdIH6bjrd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX/StMafBX6IdO
 iwWXl/W7l19Z12TUFH2Am5BPsCFWZXL4YjXgcaDmRnIzqhdYzMLorcMBybK0yDSHBfTnWaXIkAo
 21g2LsAXbH7TA8yLul0cUN0jSWn+H3k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040

On Mon, Nov 23, 2026 at 05:42:56PM +0100, Igor Opaniuk wrote:
> enable_store() sets chip->enabled when the EUD is enabled but never
> clears it. After a disable the "enable" attribute keeps reading 1, and
> eud_remove() disables the EUD once more.
> 
> Clear it when disable_eud() succeeds.
> 
> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
