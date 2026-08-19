Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DBA344DA2
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144717; cv=none; b=kSY79ql83K6kfIJSdaKkeTyakhz+FW2H/KZqZPzOPer+tX1d6mugqHumDv8lzukANaHz3OZ7ho5An2PdriYelzJg+vFSiHIl6wf0VAU7YDeGrL9rmGrQQwFEa2xRCnDvqOEn3Dfa5DBS8pHXUIqkaSku4ZbdiGSeAZwFbzTcJ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144717; c=relaxed/simple;
	bh=fOM6BaeYdlCaNXJHSFSCfjKqtXtX90PJqbCu0BgzIAY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ulmhiYTYKyIeCwoyc7GYYymtsQEyldfAM9HlGZPSS2OqG5m7Tl1AZa0/+N/+Cod3kPE7QSoc52XaV+oVp8i/PwCmnH6fljMDNJoYtpLHZav51XPe6BckbYCKWCOAJyyEUZScFb08FV1RSekFPL2vZ7XwTvAwuKMDmu9b/vznhgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IOV8xG48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gYtS7mIz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IOV8xG48";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gYtS7mIz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD08bT4045449
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HeM5xwcDuK+
	Wg+gJy+ElwNkTwE59trjiCqIy+PsKaZs=; b=IOV8xG48ylRcgOOlwPOkGYZDVVc
	sQaLZEzUHIMcQ9BbNqx5lE2Brg+Y2Dmv07F9LXYdb/4Yy5jsOyZ/lvau39g+czJn
	Sl7sF1vO4HezNhRgvHdLyuMxWMdHYwVNjS0zrgdrpijO9amH5Zr0Gn2hG/s6HpL7
	hbOp7957xeFVuNEtVsQzVeE/CeyqnzNFyL6fZbXVjjbgM0cvbK1fsSaIUqNiCEgE
	d5ssvWzZBoNQJ/Pv1IB4kVOQMZW/UeiLhb89rH0M5phPSxdPG5N/nhTkmnONJW4x
	VEjQja3YKCYznemEhS8jsGP4J5DuEGw9GYtIRCycoUWIsx4UBSM0gxj+p0A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkkc17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:05:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ced1ed870fso2435785ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144714; x=1787749514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HeM5xwcDuK+Wg+gJy+ElwNkTwE59trjiCqIy+PsKaZs=;
        b=gYtS7mIzDeGusnjfQgR88Q2AvAJWFrwIBZiwIXc4aZojlVmiK6nJ/6WaKvvlzFj6La
         Xw67RqhKxCRS02RE1X/sZYUoRbjigbWU05pMG2/t7azW0TpbNIc775B/t/s3eyCQxCq0
         X8DOLvItI5AljzAw6K0DS2JcuRsedGZlC9/2HehWzArnd1TYM9XOaqVOPLPcLha7Zydp
         IFis13zacOBbUj1y6Xtxxm/nRHB8kvHNKYXo9/jJCu3vI/6HoHm9RhpzVkEVj6RnuQ2/
         dWFZ89B9vGlGAjy8Oztf5Z3AKnahB34AYF8jSWg5GGzcsCNMOz81OFMoHVKoYifsMYx1
         Iy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144714; x=1787749514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HeM5xwcDuK+Wg+gJy+ElwNkTwE59trjiCqIy+PsKaZs=;
        b=rlqw9CLYeke8c52z2UaakkYGLcn133WjmSmedpX0WB3AmJQu1mivuy4xxc0qqtxVrs
         u5KSOh6i44Veapqx8v38akW0caL4kM4ZBuIR7GZ3+0dqQVDgvmzs0UIey2ZQ4pPNzB3/
         ix1DOgBk5cyFE3CryS0r7o+lCgeRQj0miTBlIal3zGxQjAHhCLW8t5BOKP+zkhclQf1b
         mxfhV8Y10IKWE7C1JeVC0vxiRdss+tzeidrOQ6gppWvGMqH8dNoBecIeDQCyF1EV+46e
         NV77tbtaAt5NTs+IgKtMzpQtjvV6TPJG//e+Xth779RtbDGV7RlMgLB7NK+qltvwk0qk
         TqNw==
X-Forwarded-Encrypted: i=1; AHgh+RqGO2uupY8dAw+5CTMjC2nU8MVip7+EJwMzvbQb9U/Ker9sYc2QbNQ/iKFjoNFGgWNjeH8NsULdPlF4rJz7@vger.kernel.org
X-Gm-Message-State: AFuF++lZ58fGhcIy67AqvcNkvgvAaHTTjH6eiLg+MidwypcCZpTzSBvb
	/lZhDvgDqV1W/hxRwHNnWEx/WCLSy0n2d7Wt29/a6zjMuQxmjhjvqfflXfIEWSWWiGjk5xHRihj
	ydAntQxMymzeDXfCzcFDYKvSDXwvYU+b0ym9aQ5ftCNd8TYjr4k9NP0vpcSmF7juJ3/20
X-Gm-Gg: AR+sD10LU+vZaYwJuGfMKUcB1idzb9qmF4hjVNxLbnmovoFovuBF+V94myfht9U8MB0
	fJeqYvxzE+jXLFRsX03a5PPKFFbv6dPv01rnhppBqZDwDEVcJVIH2WTxhIYgVtAfh/aWn6oUe86
	9Zobk4JaRVbebbsuKCNepiaiQw/6dkVoQucXGxRfv/48w0bfaL1+yXRQJI7eVz0Bkx4mTlZzD5R
	kUTbGBKjRZJkDkY+f3ML88vyskQMWMdelvi2kaP2Xvh1LwGJnEyHcPl6MXWecC5WVnkd8ILmUA5
	pZIAP+AmowcnZaVHccp4RYzrOOIsEURs3uugTdnTaKgoYNpAe7FhuF4CRGmXWywU7W35XeggVb5
	+dDSzEx3X8vyz2Fqp+3zQrGpozsTPW6OH0bd2vhK1fmznYcCK9EU=
X-Received: by 2002:a17:90b:3145:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-39581281977mr3470405a91.4.1787144714333;
        Wed, 19 Aug 2026 06:05:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3145:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-39581281977mr3470323a91.4.1787144713679;
        Wed, 19 Aug 2026 06:05:13 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb304easm2697454a91.14.2026.08.19.06.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:05:12 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2 Key E connector
Date: Wed, 19 Aug 2026 18:35:06 +0530
Message-Id: <20260819130506.9999-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d8e189a3-a6ed-4f49-a1c0-74eff444a2f0@oss.qualcomm.com>
References: <d8e189a3-a6ed-4f49-a1c0-74eff444a2f0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NoPhtcdJ c=1 sm=1 tr=0 ts=6a85aa0b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=CyS4NGskv2rmVFwwadoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: O1lxbScrOE09b33MKdKosGN6pv7OjQ8V
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX5oljno/DUaEZ
 jX8x4nijstCnLSx6GqPp5/Ay9xNa91bUUBv9gyoldy+Q8RmVC/xwoRTnVsrEqjd+v/mRhxm62ZN
 6kX8e0wI0wGn6sT/qZEFgP4zVVXSseY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXxccn4eIXwUXN
 u80qD1OaWZ8dTN2WovsuLr2EaFjZB51Rz3BTcBD/JDuUgFIUSeakKfTPvSGzrARcer80/5GEkTx
 E0syMq/DFpROxqfdwhliX3kyrj8N0/3h8C9cWuGY303xWvq3kLktvINL+vuXF3ywomi31bRhlnB
 0zC7N7HHd30fnXov/kyVWHHKikd5Z31BRqGPak/SY/Ck+XZ3ci2QViSWskOK87TF2ub/Ita8KZ+
 tu9j2H0LctjwjqegbvdmISgmuNn5jK3iT74AXfoEmgfGlvjLH7d3EYB6xEeHQ8O+sLLCueSps+p
 dJJvqnD+AH1MEx4DBsDQJRZ8vejK1HPDG7ZIde/ifleFUBV+aVQN+1W6MbaorGNu1UWpPOAZ2QJ
 6kwrvCiHQDKh/uAfm/4lAuLTqPyiIfOITfl19/53kDc9qw1zgOhKgFxHAimfc2uBVzq72182k/b
 fO1/QMYKdMDlggxYsEQ==
X-Proofpoint-GUID: O1lxbScrOE09b33MKdKosGN6pv7OjQ8V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

Hi Konrad,

On Thu, 30 Jul 2026 19:27:59 +0200, Konrad Dybcio wrote:
> On 7/29/26 4:40 AM, Wei Deng wrote:
> > The monaco EVK has a PCIe M.2 Mechanical Key E connector to connect
> > wireless connectivity cards over PCIe and UART interfaces. Hence,
> > describe the connector node and link it with the PCIe 0 Root Port and
> > UART2 nodes through graph port/endpoint.
> > 
> > The M.2 Key E connector is powered by a 3.3V fixed regulator
> > (vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
> > (vreg_dcin_12v). Both regulators are always-on and are required by the
> > pcie-m2-e-connector binding.
> > 
> > Also add the serial1 = &uart2 alias, which is required for the
> > Bluetooth serdev device to be enumerated on the UART2 interface.
> > 
> > The graph endpoint anchors (pcieport0_ep, uart2_ep) referenced here are
> > defined in monaco.dtsi (see "arm64: dts: qcom: monaco: Add graph
> > port/endpoint anchors to pcieport0 and uart2").
> > 
> > Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	vreg_dcin_12v: regulator-dcin-12v {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_DCIN_12V";
> > +		regulator-min-microvolt = <12000000>;
> > +		regulator-max-microvolt = <12000000>;
> > +
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +	};
> > +
> > +	vreg_wcn_3p3: regulator-wcn-3p3 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_WCN_3P3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		vin-supply = <&vreg_dcin_12v>;
> 
> The 12v supply is not controllable, so we may drop it
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Agreed, will drop vreg_dcin_12v and the vin-supply reference in v3.

Thanks for the review!

-- 
Best Regards,
Wei Deng
