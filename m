Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625823;
	b=blQmwlS7y8BWY/6EqA85bEWi74V7dFrZuRHsZGj1U53Q+ezc7NOdtOLMgmWMsBj4wyU3
	 m5nb4cEpUJvdoLZ7xcI48mprLpSjljmda/1w0BP00TEMM9/s3WDNq0vxFUIeZEzPLCx47
	 GINPD5A4X3aQPLckdgpAkVlxHtMuBr105DKSkU/Y3nY4wauiyHS3Ow+aFXG/i5x08Bzis
	 2IIh2YLTk5aODskd0Bgs3YsfEOpfKo9T9ev/4ZcWMwqFCpu/iqZz1L3KovYBP3lSTsxED
	 G883n51rOXUNyQr4gad/GAHZh5qK8LNpxCtEqSRjI08QoZ8s8nsandvYNISH1WEhTng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g1dUytA+EdoDg+Eu6pKR+9XMzqtgSGYZ7n7ArYD1v7g=;
	b=3r8XPo87MoxVqKzOg21vC1adgFH5/QNg9j9aXxo3qcoVmNfY5GWs7um5sYuigFsQS+jR
	 VORb8zNMbCMvU7G2xM1VZzlFJitp5gh8fQSRs+j5XnZ4U+Yri2XyU09MTCObhcO5x1qn3
	 hwvPXAUHOAKSGx2rQrloRFmGhbgrEAin2Rp9MgxJMCCg+sPgsNDP5B8FXdnzqZwXhQfC3
	 89I+Q9DwvLw0wr/9fzQYIgmrU3aLZG7Ll07C8CE99jHzB5SkqYwImxQG4RopCcs9v2EHV
	 y7bOiEB1JMaVYaHUFsJEnorocvX9sU502sBPp72RM+UY0GHfVxvpFBOpdWAfwytarpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cck0U1do;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CqreRL9I;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E9E606A329
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1E9E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cck0U1do;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CqreRL9I
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAcLg3974121
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g1dUytA+EdoDg+Eu6pKR+9XM
	zqtgSGYZ7n7ArYD1v7g=; b=cck0U1do+7MoT8wpb9pSYByRS1f9zyPEgQk2J/9n
	arFVVM9W62d/4YaWORfE7gVMkb/GCjCHPX6Ex/4jCGeym7UPg3GXScng26/nY85x
	PdBZIcB+dOexJbebuSeiTjINWgB4vKeXtVlLqdAm8GzZHQm/GCqFloIlXwTcdn0u
	StqcqimXbXI19xfe2W/a808Otw+/kkeO4nG5MbBgOH+c2VeIdWx2Bga48ZY2Afm2
	ZwxzW0KivTKL26iinFnCjQesZwyrHkoEDYlkpw+EwTok5q898AoB3vywz85Tswec
	/LvJc3X4uwnoY/oI9BbSfwDFrHKjqXayb2aT9rUzb7oUAQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmesew5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:23:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c71966998so36667286d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625821; x=1794230621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1dUytA+EdoDg+Eu6pKR+9XMzqtgSGYZ7n7ArYD1v7g=;
        b=CqreRL9I+wRCvzeX2l215BXXJfh6xbfK94yjDT/SLQBLzZiJeF9FZ+I6FEKMSdWSdb
         Cv7lByYF3lnoK7s3dFjf5yiFPyarinQG7oEfoJRqT/fwfXctM+cd5SjUKx2ZME3jc9zf
         PraWayYXEKA5S97c2e5rxCNzBQdhTqqwtVyTl11Yl+RBnqkmCTgd1Qomm7Ooy8bSncib
         KYtG++APEPpJJ1TE1CtPIcR0jI6uLOqWe9poiek9Q5rbne+eU1DumBW9bod5ybTC4dVx
         XrYO/Vyurq27w8iwGfSldsdoI0Gacv48Irq77roWVJUKJvNSedq913yOxWTcY75FUBfR
         +V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625821; x=1794230621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1dUytA+EdoDg+Eu6pKR+9XMzqtgSGYZ7n7ArYD1v7g=;
        b=jmKUnVbAnOO7P6MQAn4EEnfhFkMz8Yc/BfTQuJ40HF0WQ0yjdHCfTzJCTNY1wD62UK
         Dm63l9iGenkVn5HmJ4Kjt2znrBOwACabhCMRboj+HFx5L7twGgywGyGNUOTpUb3k1YSu
         e0z1spjddRDsMEsAFRKyR1mscqOvvXWbRxxL8t/TlxRbteY29BOg4Nkn1QrdcqqzxqkH
         IpY6feuC6lALdfoki4EukHNVrfJHtb8F9GuiKhjBz8UNVWS6J0n5KCta6++NSspZS8lX
         H8I/rb0bH80dHi/Tn5idJ7SEpj0sEYsAlgvBtWu4SkL/dcxoFuJTY02CNydegMit3AuR
         6Naw==
X-Forwarded-Encrypted: i=1; AKwUvBxWvHaYdcch+hjC7Z12ngU8DWkjntkM7z0iep03v/KMAMKWyOo0vl7YT/vlU/HwUzQgrDX1n1NhyPYG1f83@vger.kernel.org
X-Gm-Message-State: AFq9FYKVg5v/uFfVLzTkBNjmIGN36Q9ndvpA9dA8OWBiR5NduyTHCjLV
	7llsaGbpE3bKpQ9VAiSStBpsRlv/iegV+cEb7yfvRt5R26NxQ0RMU5RwSblKeIeBpB/D0zo7qs1
	62iO8Nip2dLxJzLLfniSSXJ2FeUKfkHpN9zVLcOEhWBRGYN+JF0BKmowb3Psg1vy4zyW1
X-Gm-Gg: AYBFou1AEjk9L4xW3ByFhSSJNMHOJ2yL/uI8ECQSMR2YgVAJDBhXxPoweEKYj4HL7zJ
	3za8NVfNHmwTpZbavlg5oQiMuynsde0YuEOkwCmZf6qvCzc0eVAtbtJ25OjrXzd7zWqSKIhA+Vz
	qA1TfWHpjP86mpcUQPCY5bt6m9DP6yKXItr/+8VbOuEYdL+JaWwVWpOxOdvYPKeTs+tk83koNsS
	dkXeob+JuR2lrzp8Qw+IY7E3zRDipM/xzXQNw+LVBUQNKuEUMNq83azg+K8Fbbz+rCvrMT0NRS7
	faEUUeSm6W7tVF1iH5cpY6oglOhTd4P8jFiE8a0XJl/geOEP/DowlMga2IxXPv5aTTGfk1J6Erf
	KfjEEju022NdkGaglu7AQuGllQVNYZ8GPUuRxlgQhH1ESgJzla/G3rYJPq0rcZPM=
X-Received: by 2002:a05:620a:3188:b0:943:ff70:dc00 with SMTP id af79cd13be357-9442174fc9emr1562601785a.56.1793625820565;
        Mon, 02 Nov 2026 05:23:40 -0800 (PST)
X-Received: by 2002:a05:620a:3188:b0:943:ff70:dc00 with SMTP id af79cd13be357-9442174fc9emr1562597485a.56.1793625819910;
        Mon, 02 Nov 2026 05:23:39 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a0a3495sm217300315e9.4.2026.11.02.05.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:23:39 -0800 (PST)
Date: Mon, 2 Nov 2026 15:23:38 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
Message-ID: <62dacxdue7uakeqximurvi556y2d6cosaxc3prrytneggo7x52@qxvwqe53bpoc>
References: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
 <20260830-x2-hp-omnibook-ship-v1-2-9feada71dc79@oss.qualcomm.com>
 <e4p3eycp7tmwugjdei7kyqt5rkrbd4ml3f3oiferqpfpxvnjfg@ildezttj2ka2>
 <20261101194525.4173-1-jason.pettit@oss.qualcomm.com>
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
In-Reply-To: <20261101194525.4173-1-jason.pettit@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae88edd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=_gEsykP72j_chJFTmiQA:9 a=CjuIK1q_8ugA:10 a=ukwt756SXJsA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX1Zi+w8E3zNVM
 s0oObMXZE0Q5aoTUbTmsQ6tEKmspS6oU/9kpR+IsjMYmVjFHkxg4CwAYQW0HrP0EtOwlGJSNNBw
 ZpUxVYjghc6kpe2z6bJRj8hsY+QwXG9dZKtJvmE2yZ98TF2KUXDIJtoPDugNN11jBCPOJnGfCnd
 Qjpl3oPG4Dj41RkI2Fuc0mJdwBM6WiaZmt84TBYm6Mh0F//QRp1sAUXnhyfLuRfb+UB80oxZlX7
 BNVfrfHEpYw34UMsAlZdsH7hhVWoOTgTnefwrFeygUvKWDKAlxRNAozqkrIsfOpIcHeKJwvDhp1
 eDQ/qdNlp7saCiNFzV3shHRDNggG8wI0n0FsnkZurYI2l5nFDdJxI3XAqXUqiXpnhQ+sveV6VLM
 5Dhg7OV8RNU4zmXrepCh5+iQTJ5mqcmcbvg5D85kUp9t2wC0qqzXQYdOoSmLUxGVxY5GGOpGE6M
 HEUI7xrCHhLUezU3Iiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX9hWPk1M2GZwh
 ox4cLBiU2/ufA7S3Re3EMlS5uRBrdwCgS01twpPWnxyhxaCp/y/C1aCwWmAlZl+8pGuX0HHK5qN
 Dw8pgCyG1h8VJ2yXQz9RfrIodk8jLPQ=
X-Proofpoint-ORIG-GUID: qmiYbsqbiX_lJoIm708_Ken9yyXdwHoc
X-Proofpoint-GUID: qmiYbsqbiX_lJoIm708_Ken9yyXdwHoc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020053

On 26-11-01 11:45:25, Jason Pettit wrote:
> On Mon, Aug 31, 2026 at 11:30:52 +0300, Abel Vesa wrote:
> > On 26-08-30 14:56:15, Jason Pettit wrote:
> > > +&usb_hs_phy {
> > > +	vdd-supply = <&vreg_l2h_e0_0p88>;
> > > +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> > > +
> >
> > No redriver?
> 
> There is no redriver in this case since this USB is an internal
> connection to the USB camera module.

OK. Thanks for clarifying this.
