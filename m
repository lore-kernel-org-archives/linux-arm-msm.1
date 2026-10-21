Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574572;
	b=N70WmwSugaDozgfN0DCaUGDY6n0EeyVHertsqZ2/e+jT6iTstlSgrRmAdV+74Jb4aWPJ
	 RHosW6P1I8562G94e86PIhlsc9zMQR1fFEASFWAvjO2l1w98Rc8LNk1yjQWu7FWdp9+Ds
	 Z623Avf+GuQKTehfLSmsZk1cNVnlekUECWlED7YI4c8x9JvO954TAfuTiVfI/qjfX+11F
	 Tt0hmHndP2VJboG+KF/3+IT98HIxD2INm7kWfc2PMdGLknti0VUEw45IwjDMRL5nq2q7h
	 2Ij0bPiCo8HFSFFUvU8hX9PJyHdzZJmAcSDjZPdAPXeU6pXTumgwslfFPmQ2C5Hn5oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574572;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1qyY9vNJg35boytlmY8FgdP9XXj7oos7HKLsMRF6CNI=;
	b=lJ/N8uMSYzqRrnzk4g9T3HyFsPF8tSVGLXUZZD8ds9cUAh4ANA14iHGFNDzFnuoz/rfy
	 oFsbWGd1BWkpgBsfhvtxWsw7HE7g4616m42CCwkqFP9qetfRuThKnhqTyayy3yMWM0l06
	 4B+jYWyO5VGnRuMy+KPIFj5+xV5ch0hFMCyHT6Z+xCujt9tuBEK6oGfTiXZ82Wwq+GhDN
	 a6PX/cXbqkx2r3n9Ju8bLQ3Qn/eZqXRN6dkriG1Vw79mYGQ0R0H5JOtrwUPWmBzAB4jNx
	 kWeLOJ+vqB3gJPbJeC9mm1x6Gb/V/rnYvIv0+kR5C66URecIwZInSyEWuatrTXmiS5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gp2PkA6G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ewmEhvw3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA097606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA097606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gp2PkA6G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ewmEhvw3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j9HN3711582
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1qyY9vNJg35boytlmY8FgdP9
	XXj7oos7HKLsMRF6CNI=; b=Gp2PkA6Gay0NWw4nWoX7LGy3qwnvVM1dhbgzqwA+
	OfbLIc70GMCuhPmIM6qldxx3yr72RFKnKJeNFRkCt9aCB7bu9vne1Ix9b5mbfzVZ
	YBinjI4QoLYiXs07x4MQUt271rjCH/QYPcpmUXTD8vrKxGXOkA4rctJtM8g+J8lE
	oBsiPVTeB6KNh7OThcV3Q75DfGYRpyaUIfhAfGbefL8KRMDLNK+FVge906XXOkQb
	ZNSyIiwpvMZi18xhrhS7XCc7ZHYFqzbx6Vc8Mh7G8OwzveJutLHAyigIRtlZ/V4g
	4Au35tOcXVkCTfkMNGap91FXPFfbidf8mHq6ufHr+YqACA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v39cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:22:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caa0ce0cdso68815585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574570; x=1793179370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1qyY9vNJg35boytlmY8FgdP9XXj7oos7HKLsMRF6CNI=;
        b=ewmEhvw3IfGKeS9mWlYQJjMzCCKzoi9oPEIk3J5OlddzJuP6XsOJr5gycVakjogfpN
         tIuUoKzl1MkeNUlFRsAceEfW67xN5KF0tNoppfUsRgywv/A8LbfDDh6yXM/LCQCnvV6u
         qwGkh5gFIjuyuB6Fc/PG0urC1zWAHv3ZTj0HDiQgoQ++2LKlFsCP5rBgvI07PugVjjpn
         C9j6EMXYWaG/EannrkguZrkurYvH/IjG9mcoSLD3b/tXHEGhUKD0Sqs4V3lB4KSoffVI
         yiopzJjMBjNi2ptuaGOq2iB1BIvBqlvQIZLZnCmjpVgXj/BqXH+axwHgLnA6UiMulfb8
         LyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574570; x=1793179370;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qyY9vNJg35boytlmY8FgdP9XXj7oos7HKLsMRF6CNI=;
        b=l+GnC8T7YZnnrX98bBS7BWUUeQE2pA7HEqOqQwfTGBpkyjI3WdNXIMb4iNsfmYp1h7
         tdAdYTvlrFVNErrU0kAcXLqN2D/OuyKLH/T6esrf+wDQF4XiH9q7CYE8a6B9pM8RY0Mq
         802cepFHKSd6/Jlcd1SGdzWoG93Tou+VOgdRET4Ywxai8OTPf/+jeDkkbWZm/ygViTG5
         Rz/6I7bYU5t+zfHm4HLHssUvruPiMt2pqmp6dAmCsv57M16HvTUA/53a+5dWXRjP5w9f
         tfQUhPZTiNmMS/8yxcllKKNybWlOquN0hszcIMtvybpGHapmlCo+3AjEMk8ZBPqVorH0
         KJag==
X-Forwarded-Encrypted: i=1; AKwUvBxHHGo2W5SVnrhM4xYrPjUM9nHfeeeNSNpjNOsud6xrzXFe7cGGhVX0Q/FIyDNXrZOFlsKd82BHM7G69ifu@vger.kernel.org
X-Gm-Message-State: AFq9FYJv8pdKLiSLfmNunrLvVY/icdvgkcopt9aCcDFLs9P1+zsQ0XmH
	nlNUxmNvaCPaoJOkLIWY+yy7YIIpiFwBLLkGU5bqTTeXa7paPJni9SmUJ9TqMXOVXzZpsWSLoM5
	2ASTmPN4WTmZHFP6GJF/2aBvzm9zlWSFzgKVOKCa7TyHKJl5ATjJgIXA1Nlvnwb1a6Fjo
X-Gm-Gg: AYBFou0oNCqNMuyFO9+BVofl6lnN6CQ5Ijvk3+7XyXw+oEYp1Ic4LE9c8caEgpbVMfH
	mPagYHlLFY20sVyJqDwN6bUmy9uwCBYv72yywA7AYguu+h+XPJLiJx1+4GRFkBaeJsN6aApR7A5
	RHcjGOW0nS2Rh3CsXsVBJp/yxfEHfDwCHg8KRzQAAhPpap6R33cFg7ccOaYE4WyDsTlSfBpfnLj
	uvqE23dMdoObGok4xaIaygK/v/ExvP/u+0FUXlNkZKfasiK5XISBFVQIhSkw2V6Pqkd7UEgc5km
	LcSgp4ocvk7baSx2QsI4ewxNVUz+FLhsFYmbAFu3ebOACEsrCeR46u8gC/BnfZS8gZMduUSUeHT
	CNXa82ouG5oH/LD9E
X-Received: by 2002:a05:620a:448e:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-93f57faaa9bmr326673485a.66.1792574569769;
        Wed, 21 Oct 2026 02:22:49 -0700 (PDT)
X-Received: by 2002:a05:620a:448e:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-93f57faaa9bmr326669885a.66.1792574569184;
        Wed, 21 Oct 2026 02:22:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f412sm4446654f8f.16.2026.10.21.02.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:22:48 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:22:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: eliza: Add FastRPC support
Message-ID: <k4sf6tipaehtllokqlunyocxuecttbitewgzjzgbl5mdz22jfd@p4svha4g2vvm>
References: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
 <ec2vb232k5u6w4pqoiqc5lhq2zj3xuf6yaifpiyzjjgaffpcih@ulainigpj4l6>
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
In-Reply-To: <ec2vb232k5u6w4pqoiqc5lhq2zj3xuf6yaifpiyzjjgaffpcih@ulainigpj4l6>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX/lcHeyim9Sqf
 /CA8IBFunP+l6y52fPdoLUE6mzWBqK0+GhFsJ2xSbY2CjY9+JQealLsytFIQ+aeu6HU3zYg8pxC
 7lg9tC9HFKuduxxqhgcWA/1j6U7oyQM=
X-Proofpoint-ORIG-GUID: t__g_Jg0hXSx6Lq49F2xcmrJqOdnHgxM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX2GnxlytJrisA
 FR+vYS5/IQ8aiZSPtkvPUEg6dFYNmo194JtKawVq83VUjiqnZsfvzvUTPXnDk3gtuB+mEQSsG8D
 iqQw7cugdhOvfST8W/qo+PUa5psonx6qAW8ulrqAfhWqs1Obna1L8x0c5+QAxwFmgFmomubEHD2
 nRR0xV/EUFQiuHZLY7FKhaKJXDnUOjEECAKlKAp5DE+fVW23rzQoZu6mvjQxp256JT1j6vJcnjW
 okkgwA7f8UItWP8Tg12MEEsy84mYMVXpUFae3tWHVBbRlgT6i+N7miH/u/cULwaVx8ydKw3NDYN
 snaLzcezrShnNLt/WhwC2tRtCAzLUtLdnj/LwCY2rdnMlzsVbAXv7BkUQsnFRZkkp3kK9yq8aHo
 NzZhGm46/ZgD537+VgMdjzSGhFYl22kVCwi5rUy1c7g5j9MTMAUx2t/PMO6yoscI33NFjr+CCiD
 RGAeXAS9jm4U2i9QbjA==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8846a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=eVJ3CmYOr2qKXInMw8AA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: t__g_Jg0hXSx6Lq49F2xcmrJqOdnHgxM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037

On 26-10-20 11:49:10, Dmitry Baryshkov wrote:
> On Fri, Oct 16, 2026 at 02:17:10PM +0300, Abel Vesa wrote:
> > Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
> > the ADSP remote heap memory region needed by the Audio PD.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Rebase onto next-20261015.
> > - Add the ADSP remote heap memory region (no-map) and VMIDs.
> > - Link to v2: https://patch.msgid.link/20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Rebase onto next-20260915.
> > - Drop the CDSP glink-edge description, as it was merged with the
> >   CDSP remoteproc support.
> > - Use the documented 0x1063-0x1066 secondary ADSP SID values.
> > - Drop the undocumented tertiary ADSP CB7 stream (0x1087).
> 
> Hmm, you still have this in place.

The tertiary stream that was dropped in v2 is 0x1087.

The 0x1067 one on CB7 is the documented secondary stream.

> 
> > - Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com
> > ---
> >  arch/arm64/boot/dts/qcom/eliza.dtsi | 160 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 160 insertions(+)
> > 
> > +					compute-cb@7 {
> > +						compatible = "qcom,fastrpc-compute-cb";
> > +						reg = <7>;
> > +
> > +						iommus = <&apps_smmu 0x1007 0x40>,
> > +							 <&apps_smmu 0x1067 0x0>;
> > +						dma-coherent;
> > +					};
> > +				};
> > +
> >  				gpr {
> >  					compatible = "qcom,gpr";
> >  					qcom,glink-channels = "adsp_apps";
> 
> -- 
> With best wishes
> Dmitry
