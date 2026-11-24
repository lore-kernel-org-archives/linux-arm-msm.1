Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535967;
	b=5pG2Pn78oyZkWY+qBDGOEsdRUMVl2ljv+jAPip6vX0uQHHdCWmfZRQFDmkSOFjOrCYa3
	 Hwlkh1M0jgABw0JpFxmHBwKL77p9imwtLH6n7kMRDIRA7TPwqt5XB9bSB1bkAbDuf4s8P
	 qnNVACQz0E7wyWgt2G00thlyqqBRPk69AE5jsyYWJN9n+8H/iCvyST7xftBj/PsNpjjwH
	 8btNgbdtAXhrm7fg2qSVHuelsq7av+mZahtFYC7/dzvHMWex8NjirOAj3JmBIaRfmZYo7
	 exOh9fhR2O9u6l6qBY14ahBrNCc+8y2qYJkOaz+C9ZznpW03w7szqYtNfracf3kR5HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535967;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/ymgP2Pu7WfrUuR0Fy4lwiaAA6A/0Te6Ej2xHmS0V/M=;
	b=zPN636P10stGU1Rfri8yyEKUe3oYoc3kEy3M5QD3KMjft1gT+ZzPRE9v2hapE1FxKxCM
	 tBcIo3VJCNm/7XYsJRv+iBiig6heFzRN57huXmcNVggWF92zqCUIl5JPd9LhJgT8YIl6u
	 3XRldJALCsCdK+rAsDO6Ylr83twqVmIDO8h0DgT87XSlur2MIxMROni/rgc6AcEGnm3pt
	 flPGMkwmeZ0tsyph+74N7pzNFrhS0tkfdxexNlkRJirIfvZaRUcSysgfT5A1Wug/r3sCV
	 1LoaXAFgv0/gHHrDM3Ofs7iZlMGeLKDLRL7Mzol9p9BF/ihF7+d76lqqv0hdU2VHfUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hlANYajG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZXEY6UqO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5FE606A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 15:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D5FE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hlANYajG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZXEY6UqO
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFKxrH699927
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 15:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/ymgP2Pu7WfrUuR0Fy4lwiaA
	A6A/0Te6Ej2xHmS0V/M=; b=hlANYajGAwfzuQtkjL7Z1sepk81sTBNe0e2I1s0g
	lynqJzSIsIMASN5QUcRZJ3hEQLW74fxs95U3LTmEgFJeC1g0/1NTguzQWv8JPI0W
	Pf+pjLSfu5d+AIzshnM11SLo+mraXwnvYXC9BSFWIGkB1/3IXHnDSVDs3iXyK5aq
	Y+9NiJc/sfQN9NV8isFfuce2snRaXJlCTA5qtoZmKnYaKGspOq4p5Ym4PaCzsW9a
	2GybjN1B2vQYl1dLxj7QfF/9l43uezRjguqc9Tw4IYviS6tWdp6DI4n3he+qtuqW
	ow03grJ7k4LSUxyAKMr4qHr2BikAUly016ub9E7Vx0wAdw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f408x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 15:59:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386c3309469so866131eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 07:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795535965; x=1796140765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ymgP2Pu7WfrUuR0Fy4lwiaAA6A/0Te6Ej2xHmS0V/M=;
        b=ZXEY6UqOpXHPWqcmAM5ep6Skv4usENTr9hn632ibSgocWlHAFS/iCvuPKJ+nSPEqkW
         O6ChHdRD646MrlGTYwD2pstJ+zolm8dy3XoYppm5R4rhykxCOdaieq+oSJlnvLWVQhgO
         TLZqvm/TTpan6TvVOHDfKT2x15qJb53l3M5v0gd7efrH2P5GFtO+5aSz0H92qKttD8yW
         PkRuwvC6khJfnbsjkZ1nRHrjSQMErRy6sxv/EfLQVMPJ+kleWOoPIrV0qFk1xp2apX02
         Qalr9cTBAIpZHjVmMKst7NA5t6+5cUKzExyKjAbXGFD2+vWfCYOV71doXReb5Y/lm/VQ
         c/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535965; x=1796140765;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ymgP2Pu7WfrUuR0Fy4lwiaAA6A/0Te6Ej2xHmS0V/M=;
        b=2qBh7uS0R4qrCikW7HcdFDvVtmA3+6jIjS35mddtK1YtOfXbr8RP7BwezP5kI8Ybap
         rVaQpVrMDzWcDghpnZFdBuxjokeVn1cFCvjU2XKv9Sr8KSACxLX5KIIry7FlfDvoVoZM
         TSun+iUqNEVYuCcb6I/rWTEYhPh2VHreSFLBS8OVNQATrcgzVRckwA0ER/ytZrrqeYY6
         avH8xN/GS+rfW9f39ZjVVNTtb6s2VJvsmCfSWwuJPSNk5h9W1sAScXTSEU/0x3bM+fhm
         Cn8aMxb3V9wwUGmUUzssCYAJ3ivWigldd2gnovaVt+C1O7pCAJZJJTLFaMiOIwiYcg+3
         Gbxg==
X-Forwarded-Encrypted: i=1; AL+hErG8l5VHu05UvMzN4FdktdE96ngMeorOWFrOI4Sl6UKrD2LG8A61L9sk19AXpqZ9EPh109+bFhhxmv5Nn919@vger.kernel.org
X-Gm-Message-State: APuU4Z8EKtwEDalb4Mh2AMam7aSs7/YNN5x3u5QVubsEkku1vpePODIX
	8snCqhkCK30OooxbGVuBeXb4B9LZn3Vd6cTbCAQfqvtZEgAo2aQL9vQQQUqup+t2Xw8Ju6C0dTn
	sWx2S1gFmOidy6D2VscXgjOpuE7NMiP2ORS4bU2gicjaetzsBVZhyqKUsuzYsIFGILmwk
X-Gm-Gg: AZFdTZdgfP1kDlFixs01g18d/i8iRlNdCepEOwMVGWFtxXI8izXpdb9Sdq51dzkcQNv
	lg+OqL5Ma6GBpVAB3/+Do182aVd7klZ/tJZBmhkiFqYh28BAL5KZDqE+odpQqpVV5cGBeKmVxDm
	PkrMiTwuvQxr8av84k9CMCvaBMdHanRbWPPgR0GQEzfnwY2QU7TvOnIRY/JIj2iygtE5qO7NUNV
	Y1s/vE5xrKKqZDOYBB1UgrQZe4Xm2NnUSSChohFRyaOHyqVcOCS3LY8CxY/lzWAwCRnsiE/Xrss
	p0p60/F8IE+CYmGcYLhYt4vok7uD9URJPhdCr0DWRhGYqxd0+uZt8yA7tpDa70TAeZsjSBhNcsL
	5U54bqOwe0MD6WR9Szi2kji8yMnO8xkXqn8wbF+QDUDmoVP3pytrCbqBytuYSS2E=
X-Received: by 2002:a05:7300:de44:b0:375:c5e1:931d with SMTP id 5a478bee46e88-3857073ebabmr15332074eec.25.1795535964818;
        Tue, 24 Nov 2026 07:59:24 -0800 (PST)
X-Received: by 2002:a05:7300:de44:b0:375:c5e1:931d with SMTP id 5a478bee46e88-3857073ebabmr15332040eec.25.1795535964046;
        Tue, 24 Nov 2026 07:59:24 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm56303922eec.11.2026.11.24.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:59:23 -0800 (PST)
Date: Tue, 24 Nov 2026 21:29:15 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Karthik S <karthik.s@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 board
Message-ID: <awW0U9S/bzxf2k3h@oss.qualcomm.com>
References: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
 <20261123-lemans-draco-final-changes-bringup-v4-3-dbfc15cd0883@oss.qualcomm.com>
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
In-Reply-To: <20261123-lemans-draco-final-changes-bringup-v4-3-dbfc15cd0883@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MiBTYWx0ZWRfXwNsigm9vmzZZ
 YrgVsTROi42nkh5amAPBjv8gr/qgjsX55j8UdMhSbYbAV7CzJWDzoQ11t7tukmkpANtKGVDKWtV
 F4aeYTdWvZHThSF9klZlMZDckTUz1jw=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b05b45d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=sHvua49BMD8LeQgnyuYA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: EHsSaUJ3jH5B2rdwd5Qm8TS-IqClxmU6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MiBTYWx0ZWRfXxFeutPnJK8Cx
 8ySDC4oAFZrh/xTgga21ap1yOaIFG/0aL5hAui4LWyNSBP+VLsjbI81yQI3D9mMFl60x8ueHM2J
 WlHq+xxgXe2AEwr9yYYc2GPxLqYKb+xzXa4xfl2x9uVPoxjivNwTrXhZPf8SeP/Y4rfzafijrfs
 rGB/ko3BRN4XQkIltplJZia+xqrIFNvZKIxGgh9F0aM83euFz1iWx9IvaZcI03VdWN3KYKfTX8W
 jvwKQVTTQ7lD4tdVVyoyaTfG43A0P5SnDB+zMP44/K1pZoAHWMu3hXiB0Cw8v0gyiOCb8zVNukr
 2cUgv818eaggNfs0g7i6Fk2qzxdgInCuM7AQsI1GJAAfwZh4Jdz+81kl9nAYS61CMoGVAblNqlD
 vqQwI45INNAWVWAODp5stgZzBjhPqhntSAc3ChEWjZc5MJ8rT9YM4qft1/6vE0SbGsORhGOgTf4
 qBjiIuh13G4KbT45bQA==
X-Proofpoint-ORIG-GUID: EHsSaUJ3jH5B2rdwd5Qm8TS-IqClxmU6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240062

On Mon, Nov 23, 2026 at 04:23:12PM +0530, Gopikishan Thawre wrote:
> Add the device tree for the LeMans Draco EVK platform which combines
> the LeMans Draco EVK SoM and Draco carrier board.
> 
> This device tree adds board-specific peripheral configuration on top
> of the SoM, including:
> 
> - I2C GPIO expanders (TCA6416/PCA9534) on i2c2 and i2c18
> - EEPROM with MAC address nvmem layout on i2c18
> - Native DisplayPort output (DP0-DP3)
> - Dual Ethernet (ethernet0/ethernet1) with HSGMII PHY over SerDes
> - ST33HTPM TPM over SPI16
> - AMC6821 fan controller on i2c4
> - PCIe0 (connects to NTN3 switch) and PCIe1 (routable to x4 slot
>   or M.2 M-key depending on dip switch configuration)
> - M.2 E-key connectivity slot with always-on 3.3V supply, PCIe and
>   UART graph connections for Wi-Fi/BT via pwrseq-pcie-m2
> - Audio playback and capture via max98091 codec (Tertiary MI2S) and
>   VA macro for DMIC capture
> 
> Co-developed-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Co-developed-by: Ajinkya Inchure <ainchure@qti.qualcomm.com>
> Signed-off-by: Ajinkya Inchure <ainchure@qti.qualcomm.com>
> Co-developed-by: Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
> Signed-off-by: Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
> Co-developed-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> Co-developed-by: Wei Deng <wei.deng@oss.qualcomm.com>
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> Co-developed-by: Karthik S <karthik.s@oss.qualcomm.com>
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
> ---
> ...
> +
> +&serdes0 {
> +	phy-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +};

phy-supply is deprecated. The SerDes PHY on Lemans/Monaco actually has
two supplies, so this node should use vdda-0p9-supply and
vdda-1p2-supply to describe them.


> +
> +&serdes1 {
> +	phy-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +};

Same here.

	Ayaan
