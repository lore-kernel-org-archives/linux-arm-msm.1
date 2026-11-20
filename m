Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169277;
	b=VmcLNWGZlDd6YtW3rW8P2pdN0h3VQIs2cYJbzzhfhYzwXUUrnYdMtkGkH2IQK76MQxmp
	 y2uthabwIMFgr4CZqjJHvmErUAH7r+SU80ikoK63tQVOJX31ca/lQS8jyd+iH11OlrXja
	 1IPjj0jmAAPBPNRcv5ucHsbcoRV3px+ip8d/RRvcEOp598CEngCSYkz+gDR2diiH9hrih
	 aSa1ARVIQfz+8nQEXJizMNpeQmXyfDrk1AHB2jIa11KgM7dwjkF99kwZfpXd29VdgCVXb
	 3VClKkhsDw7C/XPMrLQpGDZBhvcz+spBiU7dm4EOcEFkQET7Ie/5TsHYtB9QqexW9cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169277;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mG/rT4UghNUXT3K+3KmB2T5hQ5j4h+o5zz/Q6dODnAc=;
	b=quMWXGF85diJBojUcny+KgPl5sLkz0HO8LQ5Jrlify5LZZa35pJPZydmUXKL7RfgK6yA
	 TVZ+VPGUhGot4Jkt46AZe8egD1GclS+qTTvVYTkezxKEW8B/w2vTujc22Hugncq3mnx+u
	 lO4L6v0SSCfSs5KrI8azAvNR399yVMfJ9RBU34mL8T+KTVEEbY9avj7ipjxYIGsxuAEBS
	 GS9lcUnJKE15TL3Ij/U0HTK0nfvdeXiRW5piFfeh6R8iT+FC8kf8oN4ytGA8uusGOPLxd
	 wlhvyF9Y8uZ8Sc64su/5odgBM5MojFFnnXZ/heVotsDvOGn4SdYTQbcfcPOe9xNxHtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqHRQxxi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gR/nZ5lW";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA4E606A326
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA4E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqHRQxxi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gR/nZ5lW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f2th1112305
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mG/rT4UghNUXT3K+3KmB2T5h
	Q5j4h+o5zz/Q6dODnAc=; b=MqHRQxxiczegEAQZBfwxNU22C/SoRCgiQ0fJlCqv
	/czQxgk9Dt6LpUggnt5Eok/C0MnS3wuU01IFVPJSnQUJ8fLmi9gy1cQBnNGLF0PE
	1exYOLwsDYM1VmVyAHfEoF5b/dCiXq5ULZPb7FrzG2sWwsJk4EC7+wCvAZPvj6Ij
	tkJrZSBk+4X3/JDGM4LDTyzF/PsK4Z1Dc17+AXr/sCi+VnQaLD2Nja+qpUnVkNsx
	DbOZZiPjmFXpUaDdB5AddWMI8UI1zOxNwiOcZB/zxq7Ccl0pO9xvoRyBKPtHLiQ3
	c2cdxHU/B3rpF2ArVOJMXHBA7+xNE3DExLwrbJ5Ta6XYsg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjts973-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:07:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9213237a52eso15992806d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 02:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795169275; x=1795774075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mG/rT4UghNUXT3K+3KmB2T5hQ5j4h+o5zz/Q6dODnAc=;
        b=gR/nZ5lWSjrcMVuk7HciyFObAo/bq4uwaY0xR+5vFDlj88VX2vqb8CELmVMI+E6DbL
         M1yTLdwwCtisZ28m+jrobnLwAATeXa4g5nWL4a9ssDir5yhPmI/vEDU7VDlcBbH0CW9c
         2vXSpkqo8Vt3LZ11jSTOfIX5OB3TES8emh42t1B1ASUy4UU75tOQjlc1B9xAwrZnueJ6
         5EoKyFT1cmug5yW/TWFSu5v13z6mMz2hwahxAJSp08uxizNfXehGrgiaQv8hDqnG3CNt
         x3esoPtff44qxh79jt3AXMaeFfGTTL1ONZDWbCBsl3urtfer267CZ6qU+HbuNpPmR74X
         x0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169275; x=1795774075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mG/rT4UghNUXT3K+3KmB2T5hQ5j4h+o5zz/Q6dODnAc=;
        b=lSn/SUkT1rLee0GHw4ldafXjHCpz8OCNdPvXQUOchxacO4KSqUuR3ZrUvlfLRPSPh3
         kGdjATmy8l67yuVT+1HRaQ0TkbiJcC6mEqhiUfsNVY2OsCuKZ5NN2sYVf7thWpeLmTDM
         pNciOQo7Av5eKxLlfp2lg1jKTQ+I92SZCdrDyte5tjiYe2eyOhZnTvo/+VHuopzxqI3X
         1KhubTo8BbSaEYExy6U3q8qVe1YrYRhjcjbAbD2fLnsIv6jQdB//7SwFCkfeoJuA7uIE
         V+eNNSE4B6O1AupcKD86RtTjlREJUI58FG7ERYSv+8Nc69BhpD/06yTcLY8Qy352zmcs
         zHjw==
X-Forwarded-Encrypted: i=1; AL+hErGbSkmksRTsgli8C4T+5RrE8+xTFB8o0aV1EWJeBqReLLWG6eB+MNpi2JEI+8l5oGHsSqvDgN4KbI149mZB@vger.kernel.org
X-Gm-Message-State: APuU4Z8iTuAHNHlxhzqIIxB3oeX6x5UGQbUQVcI/+9kDlJfCmbpY+YN9
	yZ7UkMkPDBl2oTfTWuEJuwP1ljBUjsqOHMp83HislFVkS33pFAS8ZNJJ8zcblHdBADikw9cHBve
	zmLcR934UFTP9UoJJPXtGzXoKag859TfPIg0F4gddI3f8oFpQInmz+Q7XaOePPBEirN3u
X-Gm-Gg: AYBFou2/hVeZBn7+F2H134NBC1qXn92jZZY0BPqkDC6VLtFvRbBB8DtJb1NWRSk3pa5
	1COt4jXyBWitU7kaubGro4SiF13mpDWSAOQz7dnrL3qnhqeAJdL28XHTemLw/yvKkl42PNJ6arD
	QYOuGeR/7feSaziaBo3UkG3qqKVdADvfASu3kqi2mPnaxDvVy8tA5vlWj/LBHjNm2Cw1esPdQim
	CpQKeS0dFouBkZo6CDpRcuOs+UXuErgRuhDS4gX/eh+VQYuDBUwfiWbnZK33LJ/JXo9x1g0Sbx9
	9uSYu85vbzIQrZTB7aZwYclDK1A0FrIh79o/OR8B0WaQypJUc6elxyDXplVwZQGgk998DA24vAz
	lBnz7xwpAxpRdfE8qnuhgyNJewQUrG+e6HbFasMjYoCxtWByC960a90fVGACbnmEy
X-Received: by 2002:a05:620a:f11:b0:93e:5016:e3a6 with SMTP id af79cd13be357-949ba9c6e0bmr449682685a.26.1795169275011;
        Fri, 20 Nov 2026 02:07:55 -0800 (PST)
X-Received: by 2002:a05:620a:f11:b0:93e:5016:e3a6 with SMTP id af79cd13be357-949ba9c6e0bmr449678985a.26.1795169274365;
        Fri, 20 Nov 2026 02:07:54 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f1b2sm4306233f8f.25.2026.11.20.02.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:07:53 -0800 (PST)
Date: Fri, 20 Nov 2026 12:07:52 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock
 support
Message-ID: <6r52ghmfpdspeeh5ucxbcbcoir2fti4j2pyptdomgwouudpo7e@qsspx4h6hjmc>
References: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
 <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
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
In-Reply-To: <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gCxtWQAGEAsS7ig5FzVUOeUXP-20cMFT
X-Proofpoint-GUID: gCxtWQAGEAsS7ig5FzVUOeUXP-20cMFT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfXxgIKH92Oh135
 BeO7hmlC7ZB2vYmphm7EVuu1XJbN3oGMw9Iz+AVkH/wxgR1V5Uts56KL2RoYzLk+rvtEX12Wae8
 oXgu7yFzC7zjoUTthLsfEvk1m+MLZopmU8j7lTj5ch4aQ/kcTi19kN7fVcJLoFAhHI702Nmv0Y7
 2iPLGlhSo2ExAfRsmsjqbPQSII93JxyrE8ISxjvE1j8InE3vUMuWKfBlNPWLDx+Pl1nd4WbDpqz
 y2BX3qQVmMzhCRttHz2llaXaoVyyO3ck1uQWTTOIAoh98ubsVXf5nykgCh0H6C5iiNx6tUVag+M
 wO5Y0vazaLCcPrDaWwvw7hP+/LpP5ScU6KWCR2EFBMQZwo2NkJnUY4PcJgGUACVQ6H5WzhH91b6
 Mexmb1sdbkzEnaVsicoaES7M4XHBHz/1UUuOYN/yfkFSN1dZ3czAbJhS3U0QQOJBvyRRNDFqW/h
 RrMz/afx3wECPbq2fSQ==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b001bfb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-HzP2oy_C0ZWqF548KoA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX5uC5MnKGDG6W
 Dn2azoh2i4E+vUA5Sau5+uHMP6dFrFGPv5CwSLak+0AHL56/CsGYTJjKEp1qcHTa7oMjd6HBKeL
 /C7UScS54DkY+1ojp+ak8/C4hx94yp0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200040

On 26-11-19 22:34:21, Taniya Das wrote:
> Describe the I2C slave and TSC subsystem clocks, reset lines, and
> parent PLL needed by the Nord SE GCC. This permits consumers to enable
> and reset the hardware through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
