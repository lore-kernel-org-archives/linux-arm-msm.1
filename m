Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1B84477E7
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 14:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784815916; cv=none; b=K5G7wfLlfsLhGchboN1p3DJeMOihcCo8lQRwH7socqimTSnvkU3PhYYfpOh0Gki/iCAt29yzDB6hM3Xp0hM00BJ+BNhX+UVbulUAsRg8H25cKfzpsD6HJiC/3OICsdIedev3vXjLhb2dzf8c/AQ2PlAw8UXPz6RIeQCXtZyMVp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784815916; c=relaxed/simple;
	bh=CPhgLJMrgQXkYaTU77cWyLfMwrL56DdAaTzs1u3apfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qN4e6Cd5ITrqZ0D1MOWiygv+Y+4HracSwfd/yeIEbrdh/svevNXwE+gxsWqyO+XxUy/iAXahPcJ8GsFBPstfHxMtGMfWgjph92n+lvId86a09ocW5z1Dej9vMWJbgbyAYkzcUunOvwMHHW1amrvlynZCDFbuegNSwqIbvwCwbEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2XFfFvv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guFbdkHa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2XFfFvv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="guFbdkHa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvqPK011937
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 14:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xgtVxRD7OGmZONjmMivsjFjN
	XoH7WW15Kf0VYABqvPM=; b=V2XFfFvvHuT12FLWE3U4UMP8JNSJLohdn60Z1UDE
	c5lkAxxJulKNj7tIEGHxEyHhkHi2c0ZlUOhi+CpFsNwblBDg3rdtT3u76prF4zWx
	nqAfZrQR/xPyOUg/htIcaEDgWfDd3GvaqTQA+0l7U8JXe4shu1SagAw20A1+J2Mr
	wc4nd3anVfhVDnPbiFiobufhbl9Nu5cEcOf3gQ13QWNCvYBRFpujdODSiJmnjNTr
	XgyPhtvzEhla+ZEnz9sYDzp1jrkhuv+ybB2D+p2nkf6nRUdkwIIRHkriyNNsZSrv
	lQGh7pt7OfrTLgaX23bwt6M8h0PvDUtSDmKmheWYPwFJCg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayhaf7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 14:11:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a23afcbso7302011cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784815904; x=1785420704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xgtVxRD7OGmZONjmMivsjFjNXoH7WW15Kf0VYABqvPM=;
        b=guFbdkHaQTvFZebn0c6nM2jm46xURIao461i0GNG4QHAVd92HrfUDYgNkWwRBK18bO
         /IdvuOs317Y5LykHNJ/v31R7EkKysWln3S09dut6kUwCw40L+NuLG1asE5pw4zt/bqvd
         eiANg3XiL3P3mmH+VwUc/U5eKDn0xaxaEvaCbD7sz0TCNgJKLqnnDPFH7jmOfbxMdxVX
         QjWaDyGZ4VolBzqTvYegU0z78xU5jq2pqQ8mAjqvddlLnF9LOmgcVuGP6mytWW4QFMm9
         4M1zwH+Xn+O4o+7KVwwEX/AmCZx/ay0RosFsXkmONxslAYK4fMvx9X368MElbx/TgHoY
         I8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784815904; x=1785420704;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgtVxRD7OGmZONjmMivsjFjNXoH7WW15Kf0VYABqvPM=;
        b=ZP2kJTd5l+IzRgbeupbA8501lfTLKvRM1+gcWiYIWk+HEmWZ+wOpk7CHzWbtzP8BhL
         duyrJNJ+9Ys6zlY5fTXyNq3YP0f61NXkDXgvkrblS9GCYlGLpkBdJYLZ4KN2jfxsxjNe
         Fl7QtR5hFcywpqKaVfVcT0z4AobUzAiJdH5FmLrLmZMg0XK90M+s+OnD7YA/sFiMkkR+
         xJSXk1AhS0XgC7fvhvqvC+qbgABR9Ns1hK2p/Che6wltDthT+oa2GYJwbNUcGNqvk43q
         5ptkey9xVIAslC+R+WS7iGIfbu3WThZ7N06+psPUQYLlPdj1HqhyJS7dqnHDx4HjemHO
         lqEQ==
X-Gm-Message-State: AOJu0YyVpMOOytKg8rs6sx4kSJRmZEjYchY7VT0Jkwfn+u2S1FBAOsih
	LQJ8SSIvuGnD+KTx8ya6zfr5fWlvFiitp5ZqWJ/8DhfCt1AeCCU1TSFXiYWaf1NIhhk+CTStRPU
	3lSc9phwkvGqZuxadmWS66r8eyS25YJGIfuJ3IXVLtg0fhxKVB9bdNe7fqFkU1GjjSZO7
X-Gm-Gg: AR+sD104j1mezKATFmh0rjFcG/qpyG45Yvsc2ULjcyFukCy2o8/LX9lW1YOKPLSqnSc
	wTToGAg6QiiWZ+ZJ5VhJgrroIjwI0R1VMxva16S0roNBF1oBA/uLSYbDJvCe+GoJI/ChWqb7KQO
	+8FkjVwsOwdNL0yk7/Er9M6XM4i07XrytU0WMLYe7h4RnFHwqE3QyfDSnnfsYYH/ZcRaVTrpkim
	vpwMkLyRnSr2kaxsLH8lfTeSlb20MRnZzmV+W7NWeoTRnqglmF+6ykKT8pNAX4qqxsPuSyDETi+
	82Z8qbAx7v7S1CpxyLsreC98B1VmWwoEZhi04k/AIjXxgg5cUVVGPXIJB5LHfQanCAjpTXkSWJI
	NpXb3T8ViDoZVZ5c=
X-Received: by 2002:ac8:5751:0:b0:51c:1ec5:d0f with SMTP id d75a77b69052e-5283decde2dmr28736131cf.40.1784815903906;
        Thu, 23 Jul 2026 07:11:43 -0700 (PDT)
X-Received: by 2002:ac8:5751:0:b0:51c:1ec5:d0f with SMTP id d75a77b69052e-5283decde2dmr28735401cf.40.1784815903168;
        Thu, 23 Jul 2026 07:11:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm15771693f8f.18.2026.07.23.07.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 07:11:41 -0700 (PDT)
Date: Thu, 23 Jul 2026 17:11:39 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: eliza: Add CDSP support and
 enable it on MTP and CQS SoM
Message-ID: <sfrhxa4qoxiagomo43xyfip6roph5crhh3mxe6xo4k3nucrqlf@bnw3smjo2ezk>
References: <20260723-dts-qcom-eliza-add-cdsp-v3-0-93e17e687384@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-dts-qcom-eliza-add-cdsp-v3-0-93e17e687384@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a622120 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c6uvhakSvUugixP10tEA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: _W-f3C6QbhTxSXZzTo_-HaJFB0TW8pOG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE0MCBTYWx0ZWRfX0T8uPV9LlM7A
 cZBInPCRLMF9BZsl8+Hl3cqEFuX4vigfNk0o7QxZSgdt0WHyu8I7TjjFsOLT0ddFWO7zedIV1zV
 yyIU5xkM53M+b5nRIoJ9+gWJwAASykiEdQbFFey20V+w8awiRqFwN3kxF7Xbn6XjK7wFA53N/+j
 7SNRrVfYKor2T7GJ/TYCwNcql68OM5aSjy9w6T6q7XqKLEtgFZEako89bCuWe4x67OBsFeZptZw
 W7mpz4vbozLyFbNf3DdcTbJOA5JIJ/jWcDz3rCaEsE/SIhI1zMjKLGzgcuNJYqzwYEPVobuOhhC
 BpcB3a/Un65ZhxVdEQnn63XDZ50BKxRo/Q6VaDDpv6QLnG4mYTbxA+vazDsj9RRtsvvmU59ZH2l
 vCG6SzKwa5kF2XueGSfWQoc+mghJ/4vszFs+pi2ccutBESsZx8fVOu9Sc1HFI5RHpgP1vCmg71p
 uImSfbGuz9OZt0zQF/g==
X-Proofpoint-GUID: _W-f3C6QbhTxSXZzTo_-HaJFB0TW8pOG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE0MCBTYWx0ZWRfXwcyt00IfEJYp
 DXwE7gOgSn6+UH+nyEG0YavanvJ1HjB6JrNxn3nxzLbBzMDrKG8xKeCsPuEcml4kRKUvg75IP7Z
 JGsbVFpw7j9h8jJ/9PfXOIBjz1vmWlc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230140

On 26-07-23 15:25:49, Abel Vesa wrote:
> Describe the CDSP node, the glink-edge and the related SMP2P, then enable
> the CDSP on both the MTP and CQS SoM.
> 
> FastRPC node will be sent later on, along with the ADSP related one.
> 
> Driver support and bindings update are here:
> https://lore.kernel.org/all/20260722-remoteproc-eliza-cdsp-v4-0-04c6eee70cb1@oss.qualcomm.com/

Please ignore this version of v3.

Sent twice since I thought my b4 messed up and did not send it.
Turned out lore was broken.
