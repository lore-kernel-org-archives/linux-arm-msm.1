Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263020;
	b=Ls1P0oamJgPY3d9amE8GGycTX1eq2opgUEAtrDDtCg4LhdqsGW3RL7BoHDehovA/t+wX
	 q0WMbJ2tyMBDqUvLyft94l7LJ1JFIN6/bxk9/l5LocRpD5jbYY3Wmv6S+mJbLLf/6bccf
	 9NKjrtJErtrLYNjJ9vNfURmP6KGiG3/d2VUCjEu2n664cufG9kWiKHZcEvuOxh/nwBb4F
	 ffK/QmvVRVWQQD7HsMgff+2rZo3Y/PsahLLlHPIaP6vvhW/BipuGDpukd8Ou/ij6jcCCh
	 ESpf6aKV9NFqvZn2r2MNz0Dlkg8N6/edLv/oyfhogF3s2ptlbSfONs70PU+i/qX0NTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263020;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vujVPiEFr/2gWrI6pDf7goaXpBUcQ4bvbSz+Nt72RLM=;
	b=3TpTU7boO7HU/4PNdgQazwwODwvlQnHPiqXTXVwEqE4LVlZ/eK6n5LFk5HuyuhXQ3mzz
	 LBVmTAi1NJaj+Gtk7ttloKCyPwTaJWJPHlnM2yObanOht41gy78zLA+roYgbtXdRFbbnN
	 HwaS5M3p/ZRqAD8zHaHCPF6Bc1luLOA2xtu6qOKUf5ANDOqXit0ELMhZeKi8fzS7TAXcl
	 P12VunZkFpZhJu/t7jrYw4osQNQqYNhIDoI33iGNkq9vaYZEABUDWcGXiXuoB/DjRJuW5
	 8r4sY2yZQrNq+o7Vi2Udv1Y+4oRtT/ZUaLyKhoTfnKIZx6kRC9z9faNhcjHVp5GY6KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqnKv148;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Pid5b/xg";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D84606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24D84606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqnKv148;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pid5b/xg
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H6sX3341392
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vujVPiEFr/2gWrI6pDf7goaX
	pBUcQ4bvbSz+Nt72RLM=; b=dqnKv148nup2qvAaDjk8osg/dUi/AcftsIbH7dTW
	aumvlI4Eghetc2/dgAsncGOrvJ3+i8/RJAj7a/exhj3Lyc80t0XBg0luZEORSLoM
	85CcGKlYQ2H7fFhOR89T3W/PprKH73NiQzDrgLPEKny6M8lof4tyLCpld76Mpgap
	qqgqH+anDuldtgvELfxk7cdr5lcz3K5uatabW+xMZGboyx7JG7NTQWEMH28mlELP
	u20nTDz1sKostSKQBoW45W4RaS3Q4maU7Kl4RaFkRQEGkQ2FPGDtMzsZej3OSyhk
	t5qOX0IO045wuMdnuFRIMYFEHBt5//5aos5Pgq/xCiABFg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3hfym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:36:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53395d51187so32023161cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793263018; x=1793867818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vujVPiEFr/2gWrI6pDf7goaXpBUcQ4bvbSz+Nt72RLM=;
        b=Pid5b/xgS46IKCInNIevRl9mfkLrxUaU9eH+1GmodeDW6JpOtjiSpGh/IOLSwnWNi3
         Zm3usjkc9RSNy/6Hm2PUtiJb781qwRDc/74PQ00qwbpt8fAX17GT0gzMlz9tS7H4GIjP
         /VGd5nxh1UTig2KBanmxohzd92N1W428lvaz6rAeyKikcQqCWgB0FgA90LdlT/xbPBGx
         l4rHQ75XeUDt/zlnhncQshdXz6WzW/MBju0NOELHP/vJjxklt+cTSu+If1zUyqGlVuFE
         wZ2Rt2i/AIGfrY4/4W6gMMt9YtxcmEXz6BoMSNo4SPOBpg2So/WYY9BEoqyHSC0eMsae
         96FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263018; x=1793867818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vujVPiEFr/2gWrI6pDf7goaXpBUcQ4bvbSz+Nt72RLM=;
        b=g3lKSnxNbCUO+PgtBvLbmPpDwMlBf1CeJDABfafMVNBiA2v82xnKrazEZAxEl9khkc
         C0p/eqtGvmSu7gYr0PJl32WOu2nw5z641q/6ezmP0Qaj3uAJd4uvjltLoVwtQU15lzU1
         O+/sVrrypSbWu5wC+AZISdfu0ETtsZLS6hi9rlCblve9ZappmfD4GlipnFBJVLDXQJvp
         zasqQ9ETAi26hXx///jgI6zulR7KBmMH4lXd7SkBh6bHNzQbbfgYXdHTvCYzwRcEWLZw
         Qonu51iIFzi6G/Mwh6V9P8weFKiNcXGw94m8/n2Nwq09dZ81iB3JLVnA6OQXrkoVswBY
         U2GQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdpTQ9pXxb/DnIdWrtPO3K7RzR3kLNrBOB70D6fGDZnYYLd09KRx112TNAzzNmKFlKX/3aIf50Aa4Smf9X@vger.kernel.org
X-Gm-Message-State: AFq9FYKAbN1XwEzgtD4OnQIRIFp1SqbkGvvGnPby9wvwXgQZ2jGy7yvp
	LJuZvcmmzuI1BvxbEpIov3PeyfdcFwFz9B3mPN9aCIHXHSxegiWX3BnZQ08iQBsc9eEpWeQLIsH
	fRjeJR++yza6t7gAuw76umSqksrt9kFsz35g5M8W9Nx6CmWd0Ngnh+zy7Zim5C+IXdscMi/t2MA
	3E
X-Gm-Gg: AYBFou26GR11KTvOtmF+lKk6s6F6dh10Rs/I0VqQeeHnjDKTxGqpuebiT5V8kf39FF6
	UuSkdjn+RhwXv3qqB3qgG3Qjp94VflKzbgyjF8e7cgeCJG84RZgz5FgyWcKkNDCk2Y/ZzDWaLeW
	weKAO57E+FX/OMQ5PWmvIdx9IMxHt8VdvvsKFGj6oUT1DKzD0hMp80IQQtQeEnjZ0eIrvEAwG7R
	PsgVIYksBPnNYYuLyCXpkRk/o5AQD+/yF3BpHsKoTNQ9SQTxC/WXwYAu520+vJ4FYj7N0iYnEoG
	OtBTMxeoyCDRUu31vQvwvgYVCpSHPgGls6nO6wvXagG/2fnL2idm2wn0ZoU3D7OraKXYrPRjDVv
	pGG52804e02qlTPGNMD1ji+nFn4zAdcOYhY/2gqx71aWZMDQQJXZrXcLjp4PNaHz6
X-Received: by 2002:a05:622a:40c:b0:536:7669:7eed with SMTP id d75a77b69052e-53fcb20d45fmr76937841cf.21.1793263018121;
        Thu, 29 Oct 2026 01:36:58 -0700 (PDT)
X-Received: by 2002:a05:622a:40c:b0:536:7669:7eed with SMTP id d75a77b69052e-53fcb20d45fmr76937721cf.21.1793263017581;
        Thu, 29 Oct 2026 01:36:57 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f36asm32868551f8f.1.2026.10.29.01.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:36:56 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:36:55 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: Unify Glymur/Mahua regulator
 handles
Message-ID: <227eu3obyadpuhtbvz6o6memq37rahvv4qw5gohff3gibo6lhd@fz53zt3kz7jw>
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
 <20261028-topic-sip_cob-v1-1-80ab6704aca3@oss.qualcomm.com>
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
In-Reply-To: <20261028-topic-sip_cob-v1-1-80ab6704aca3@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfXyJTldU07xX2h
 JsZ48DHl1c3TanhTXfTYngoEwyvH6HIkGRSW9J7j5houmfy/GhFZ+toEXGOM6Ioo3nVm279RqId
 2Wm6jd+MgHs4C8ZgVhrDSSGqHeqE8HA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX2sPzvILEj9OA
 usePEm0y3DDCByic5ok2OuHSC889BELaXh/amMHCMFqFMxJ5J/3D/h1bMdbBpn33PToJ/d9WNZV
 ivc02BpoJGtC9gXRzObATE+PO2xlh8ewiyJdkgg3o6ApFn/2Ar2Wyb5mDyFBE8w8KaH1eHhnX3O
 TuRXA8eoacjBt6I2h0vJPt4SEciQ8WKIMW19JxxbZiy6zjqxns7ycWeFQEUPpMGXpVSHn6jD/Eh
 TASTilzX4R0TThj8GY0pxgsNZiNyfm+QNTlFFGetBTvJ2C7Eo5x1Bc8RKxVWlMr4S4aFc0oeddL
 OAwV3StLp1xZsOshVwv58g01xbnnoKr7OA0zLAj4L68lJvrxGPo91AVjyCBG///cVFI69cttu5v
 H4R2xDkRpV7OGG82Z9k/rQXM7z7dKOW5kB1w631RFUORU+MJ+wn2nraOIp9leK6YPpCTYRUjLgk
 UypL19AJGCcAQbnrT9w==
X-Proofpoint-ORIG-GUID: osjbnsu8xzKVOhDD8y1Ge9FAX1WUYLKe
X-Proofpoint-GUID: osjbnsu8xzKVOhDD8y1Ge9FAX1WUYLKe
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae305ab cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=E1C38_a1jRb_IkRbqHkA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290033

On 26-10-28 21:04:24, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> In preparation for removing on-SoC invariants from each device's DT,
> start with aligning the regulator names and phandles to the format that
> appears on schematics.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
