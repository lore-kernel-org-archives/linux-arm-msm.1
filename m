Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873678;
	b=vCAbtyq3HgYp/6bJdmHzXoFvvnPyDie2k+DH76eWmT/3e5r81gKSrKUP1S0vPyvbqIym
	 e+Guo7G1paUp6vbfPSPYQKcgRjcL6Wq7tvgIa0lfgj5/O3VNaBmqEaULIVLEIHX4Egj2t
	 jKDUNYq2udVXi9eUfsmLsm2kXqjnAzCs9x1U0kr0O4v8WgIV9EjHCvOw528Er83LI0CGz
	 dwjpG0Gjnhpzz39Xz8xXLGktItk/iKjLnuHZiK/ZLOwsAOjNGAr3+qFWmy1RBYviN8KQF
	 0PiSdsatZBV7N53br3+K0x9pGZRAa6bjIUMeaA1xHw63oIE65SUfXe/hyqQNGt4OjEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873678;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QKc9/tOdnWTGf3efjYi86dyI+DwQZ2YvRPmsUwFYhUU=;
	b=OjnMlSAL1ZSB0MKX9qqmw4satbAml/fPWPovqVJSlPC1YfNakeDfWDoKTY6fIgoAw1A+
	 +93xQ3DBj9MKRjBiudobTDa/BXATINUe28xJpSdMMOrEsoIWswkV1D/jWYGyt6/Ufj6wi
	 /sSKVi3D1h4DgUatYtQ3fJPZ1bE4bgfKLDwzAWMDb9v8hFBctd9C4BhgBD3Bh0vyorlfZ
	 qbynuIiHFcRZhWWZDZJ/+nr8uut1qdKJoOd8AsFOBp6wt88FLh3dZPfcKVbI+dW+d97Xz
	 2O/M9ee+bTJGNZdWS2ir5FCYXC+oembk1vzDZyvAt5U4b2Sk+rIOVVSbqWzdxe5AO0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=llXsbZ09;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cw7fARD5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528CD606A31B
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 528CD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=llXsbZ09;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cw7fARD5
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OIU0W71776845
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QKc9/tOdnWTGf3efjYi86dyI
	+DwQZ2YvRPmsUwFYhUU=; b=llXsbZ09axsDg/0ECDgCXLgLw/EVNj5kofvPVZC0
	DZgz0AdBV2nZnGm204SVWTUIH0ZukScHc9msDzEKTKX2bJvZukUhxjKpOoBHhu9a
	EpKEzthaWzxhwMV10vpKyk0/L/Rxzq6eboMbo0o8qBwdIgspMl0idxAgSRcWR1A/
	0E9pv9pYrocdJt96ppDcTj9r5f+JKS4W4DtmvjJrPiqkRJTQv8edUWiSFq3O1gxt
	r8ea58yK7MKlV56ze5AenhSGxl59iKwWTfhQxV8AbN8Y/VE4lP5eU9XvDQ5LD7qR
	Pj0yBNWa27OBd/hU1VS4oaOne0obtmxKIQKX6m+RjRZcSQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnehhn3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:27:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b937ecbb4so42014146d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 13:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873676; x=1793478476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QKc9/tOdnWTGf3efjYi86dyI+DwQZ2YvRPmsUwFYhUU=;
        b=cw7fARD5dpYtQNlaD50uxwZwGLSuXRkKNlosDUVUAVfI/Rihng1Ze8Wl/IxZjkyFc2
         Bz+CDp8+ybU0rQL1M7WAqJWaEVRv3nQd/SO3WZg5LjXphFGdv86gRBrDnlzJ0UMq/0zH
         kWbhasSJcDg0dTfvxFtruyPEyA2zEVDyf/ll+mZjeTEnNcM+z2WyAbhu20pZWOzOpdlV
         imYy1bSk20b4jh/9tSN+H9oc77hw7dPIyW7HvTqxTpv5L61Q3t7Ey2ZETZLrqL8Jk6X9
         61VFM79M8djbkavE2pMdKcitDN30n7HKwo8uf9ogynwfUSBFnc1KrDRLVd72yfplkyNZ
         jn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873676; x=1793478476;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKc9/tOdnWTGf3efjYi86dyI+DwQZ2YvRPmsUwFYhUU=;
        b=v1wf2G6TafhPf+ReJ9nbOUzhUZGY1xFzPVUD3m6rjfLVMsOkxvCnbYn3whoSm+RWPa
         RZMah3/k2MnB9xnlGPtIxTt/Uh89/gxYtQgz3MhrtpbvYcTYLZMnmf/M6omViqFfO2bM
         XT9T7WmzLMZ7+19ZMXfnh1zBVb+moFhrsiq5ffzpbB3hMLdrDaZv4392sd7USaVYnD+7
         4m4tCjYjcCnafJF2EP3mH02OTpFl5JyKq86mYE3gw8cLbJQUm2O6uw6tBcca7sB+63jn
         +BdRjNq8rFw2jZ96DjIbitTJpeN5fgF0qLmkFKkOWdXVGc0D8J8AKAeH7JYZvnh7T5qO
         XP8g==
X-Forwarded-Encrypted: i=1; AKwUvBx+AnYO/xu2SgKZskblbyyAhUmuc2WyIiV/GzL+8OdCw0yjh7wo3axYPMTRcdjVzoZACB/XJVghzSXu5FHs@vger.kernel.org
X-Gm-Message-State: AFq9FYJBUylJdY14qGHWxs1QUU9YIfAHsjs+ptpMovQcb6SQtEcgXi+y
	1+8W/HUwx3cF5PqvslS4Se89A3A79ghwcfAKKjrox/7+uLzb7W6O7iVU1dYcA4u6kyl0Sr2iz20
	uhfuI+sdKpeFyv67JW70hgFb+BgnnX+idJMgqOrnrE/DnvnEImoB2oZUNcTD9eX7RVaWD
X-Gm-Gg: AYBFou3VXRVZlXM2KfBcsX1HY1hiNp/1YawL0pD5Kb6gSfJh/7H/R6kREABhl+Ha9Hw
	7I6rfUhkrYi/ipkhVwIyk5ekqmLfcvVWKxwKQwoeBvafGcNAeX/U/wFuw7LLA7VUiv6gcAjSXDh
	M45nlP1zajIl3CkP9ZeLq/+jIySD84D8yMHBLweG96wk+HpdzxT2WjWIdzTGVtaqbo/2YJKflFS
	3N8EC09c3A77qjaVSgFFga+POirY2AjSm1IJOCCPlIF3l/CRFpZjlHyzTzrXPmc8PPhEPKvxyyh
	0uMaG9/5PTIJlAFCliHXu95Jof7sowa0ajv+v7LlgD52OwSBjFECUhpTQ/d1MHLJKnH5kl0SLoi
	lgISkmBJn9xM9Kuj4
X-Received: by 2002:a05:620a:1a20:b0:93e:bcbf:88 with SMTP id af79cd13be357-940ef7ad8a7mr406806085a.4.1792873676237;
        Sat, 24 Oct 2026 13:27:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:93e:bcbf:88 with SMTP id af79cd13be357-940ef7ad8a7mr406803985a.4.1792873675559;
        Sat, 24 Oct 2026 13:27:55 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdd5b3sm6024139f8f.53.2026.10.24.13.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:27:54 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:27:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
Message-ID: <jjdtsucojghnlo7hiaxmt3oxbbdvkhmry2rke4cxqwh5bpfd55@rbdz4agoxncv>
References: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
 <20261022-topic-sm8x50-next-hdk-i2s-v5-1-aa1030a75e46@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-next-hdk-i2s-v5-1-aa1030a75e46@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX40FtwcnbUsWd
 lZPRb370qC5FWbyBOokFqcZ13k4MhwwRKIry7dkt5anIGEH8uFkpgp09evKMxmv/smclLMaZ3Of
 rOswwQ3pLcOKyYTuE9yPfxGYr7tkjk0=
X-Proofpoint-ORIG-GUID: MIiG9PGHY1ofQ3tdRRoWix3KSSuFxTpY
X-Authority-Analysis: v=2.4 cv=d5tgWhjE c=1 sm=1 tr=0 ts=6add14cd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ji0esM3nnZrMOXJC16QA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfXxU3g52nXGua3
 Z3Pa9pLi98N3pRNwzkpV8XnAmVvEg/GhKDawD3PvY1+E0Mc2QKeElKMdEqVpWGsKhOlb8SEXpPo
 nclzNLxWAL7DEEFy5rAeIQOcpYBK12CfdxblikcLQ3NQQvudTSNf2/mD1f4HzKtoRMhY+CHp0aS
 ON6DdiyDSufsbEzdJEOqMA2HZt/WqDuRqm2VDyax69U5zXBq+Hf+c5Jey3V/2F9enhKUmB2nvLi
 bF9R2YhsvkRqBKfoGdlI36FDWDpW4ZDy+CSELm8LwlsIHOiSeZIe93jgRn0K2JtyGBlUms41YWM
 XXQZaU89LcS43b97Y/5gjqWVt4XJXsDuqHVKQrPQ102N/7VuzQ1IcIhuKIkad8oNfZkogmJoUtS
 BsKkp+oLAnGCsR1qtVhyDmOv3jSomira3O+B7G5uqjXf5vbb6OHsdnxZmxq83W1THb+hliQ8v6t
 9bAmDedqHn/xWOlHyJA==
X-Proofpoint-GUID: MIiG9PGHY1ofQ3tdRRoWix3KSSuFxTpY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240081

On 26-10-22 11:16:57, Neil Armstrong wrote:
> Add the necessary nodes to configure the right I2S interface
> to output audio via the DSI HDMI bridge.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
