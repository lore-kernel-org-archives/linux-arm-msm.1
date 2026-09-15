Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C164A013C
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466233; cv=none; b=PpWaVf5vE9YqnMYy4vq3EjH9gq9TiJc2AxNZGd5dYria81C1O8OZ3U/+4mh3e5AMhxVlc/vvNK1T2snXG779N/eonsP1kHerHrtuMXc3Rbu7VM4yTjNNulL5yJDbsZsw7HqX/dD/LPsRRSdhW8pB+9MIdcidjTNxAPwmiH2dvEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466233; c=relaxed/simple;
	bh=TzgvxXELlg1BgqylTYQH/fj3qidFjiuXXGrd1CEYso8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxvNL0xkwuOSe9W8IwU/ODD4/0I0MpF9lxFwFO28vZ8r6lYR2OAsMhfmfjXXhAV2nrL8auYAqm3e6JA8aQaTH0UxA4zurLKJyWGo5c9wsfWGDWOAVgjDiGZJz5ybT1AAQ0Ftgz27A3aUJfpKfUlka1CG7MY1LkKeJjEr5QdmjIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0OjJX5n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Unqq4voG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0OjJX5n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Unqq4voG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h1us2086620
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=imS4j8znypdNs2D+rXQozrNp
	hze0j4Jx7CWupz4XkMw=; b=R0OjJX5nJ30TYV9BC58PgiAdyHlP3pQq69Nz1QJp
	hiplJlXgrTBeOEXb5uHbRwue7KVT7JKp9pviACbgZW3aqvARWmgAAGHL7uIh36uy
	XqB9G9KRSbPhfWOGb+VDVsu6lPqtrMn/e//L6b2BWHGt9CKK07zEzHYWedi5Mqke
	z3FSEw0DCAWUQtATDm/1XOwFYt552pJv2dQY6uAtvdrgU1/ZNkD2gFPSwGqXj/l+
	fJFy5YpZ3YRvR82ti5bJA9gXiNKeDSHakSpGV+pw+g+/pfGxO2KPaqrB9QEt2etX
	dxk28N03D9n/l3oCnv/TJvxVzWaQXoRrcsOu+1b8O5FJrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp8pxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:57:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so887390385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 02:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466230; x=1790071030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=imS4j8znypdNs2D+rXQozrNphze0j4Jx7CWupz4XkMw=;
        b=Unqq4voGhoLDpPavt1yB1Rs1OgaJBlKudH61AHa/icrFDXtNp7uLIJ+MPK6GC8pKiW
         7UxUt756vl8t9yEtBbFckxurc1PaWxWmtl0tTgZHrA8jyHiSm6IDqdSM91K/x+nfl/Mj
         bZJ869C6Dl3BgifE8u7rnSE+H9Y9dA2GVMw/74JxuIIgdvdolIksVNj5v3/N1cXQZX4K
         r3DDWMDuNkfduIvlQj8EJF9lj+y8ISoM9ybeQnZin8jbRsoJU/cP7yCQE9qicEfAeolv
         w3x5JviInQUnm3AKPkHv5i3ilXIU67nhl8j25XmrtG0FxNdza08IvqniTAjb3/7bB9ng
         XU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466230; x=1790071030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imS4j8znypdNs2D+rXQozrNphze0j4Jx7CWupz4XkMw=;
        b=YGSucD3LYTZLc7yIWY1ZCScyphTWCNy8O91LkMIZKA2lobhhDuav68mGZKyk5mdlGg
         IP4EjVBAdqrNfCS246Js1RM0MFKjPwBJofDxG7xJxyJ+zjQXS12igOiNIU8nYktaazym
         5h3+KngsrbVRbsONgFhUykeYfsZOBCBjTPrCbhVhyXI31ZUDZW0lYiLdQZHM5TjtbhM4
         /XGpos38A3ct2lCvYI2IWHii+Tj7e0Ibh/uw5sKgIkQAh3Mu4GCUwbYJEZz4qR660WiP
         dyv4K0Vr8v5I6we0RT4q0Nwxg/UPpWlAGid9VwaBe7f6hsv/XD8P+XPerXNw26yTRBR/
         u8tQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3sLdhDB4EFtjVLn+XrKZKHOmZ8+fwRVmwpRdCFCSgjnQnW/RmQJodUMgT1i9GMbeYdUi6owGbENnPB1H1@vger.kernel.org
X-Gm-Message-State: AFuF++mHoob5Xx7Ks2WVmngymfwwO5Fv2PFdseQVMAsVIeDzp2CgoAuT
	LuT9a+W4YI9DPxjpHZCVLeiJo7VK9Mf7xFIrgbzsQSaDyv2OHiTUcjiKf4G0x3RlEngez8CnyLa
	mu7Fa0XLeP6xL+8Ltw2Fr0hYbu8Uy/DCBKbHcbZUt5EfNlpqWxNSAaCedioaFzNdYps4F
X-Gm-Gg: AYBFou2M4F/Yh/afuL4ep3KakMmWb5PPWZq70ml13Zb4KMBjDg8XDCJEdUupaxTuFiz
	hOUe6e6/O8EBUUawNVZ5O7aI0/0WCaNGbvgiqUfGVdZTUfr75WiVLcghHUS7zQt+T4fvkglGP6G
	Q2/rKESnhmElCtXwxR18k6byEaUJdMTomYRJlqJwW3vTyupuYKXsXT6MGwqjYptLY+N7CWewz2H
	FZmbDSHkQ0VFUMrAO9P5y8fQBaVRbb+0KT5nQbIKmvAv1Cr7pGrMm80NYdvbXdJMOZuB6V5ICG/
	4rCOCDi+99CLfXbwDAY9+MSpnpGlhtqQTpxF1aHpdO8jDk14A7Dz6sZhi5dkAze2IqpGDm5vDfm
	/NRcobu0iByIIbw==
X-Received: by 2002:a05:620a:4885:b0:939:5f4d:67b0 with SMTP id af79cd13be357-93a29766649mr1033003385a.8.1789466229777;
        Tue, 15 Sep 2026 02:57:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4885:b0:939:5f4d:67b0 with SMTP id af79cd13be357-93a29766649mr1032999285a.8.1789466229167;
        Tue, 15 Sep 2026 02:57:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d2717a6sm29114135e9.2.2026.09.15.02.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:57:08 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:57:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, guodong.xu@oss.qualcomm.com
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: hamoa-iot-evk: use on-board
 crystal for PS8830 retimers
Message-ID: <4ftcpscaqocwiqsbmuebrog6bhkdtbuo5mjjidkx6aqmlzouu3@g623zchuvutn>
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
 <20260914101233.981643-3-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914101233.981643-3-xin.liu@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfX46RopdJwoQh0
 J9GzZRmDx4zlnSb2sbAjOrdGkMqyUnWeWZ8qqOUvr7MTJ3cy8cvrOCec/m+nNltq6fsNds9Br4N
 /O575x2GVa2DJiud5OZCaBk7PE8ENY8=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa91676 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QwumHbZcXSOBU_aVzfgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: xQLapN87PO3DPAuCCvGufiOmqS2bmFkY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfX/PIJOmnzeMf1
 wqDygpUTCtURVKZCOlnE8NxdgT7STIx6xyo+W6O0gJ1T/N885a4Eb1swfRjaY+cCNWyXoPGm6lV
 FZQoJsJ1o6Y9TVWPq/mXVa1nhNOcRra4gwBRiDq0Saz7xObchF8tmv0KyGE4A9vb+XWT+lB9gZo
 WC5vV0g/m9uM/AFlzuKIYzDFThwoYs2mgCWxhtzkXsYX6LpIcsZEmKis3SuTHmvmJKqFg033E6k
 iqemAHDvoJUKUGnK8+SPMAD/p+30CycNiDRqJ/fhEGgcLu4RwsFnyU9F3XdszRlEQp8g6Y7qVfG
 ucsgutuQLjSzYusH1+beGaYlTRlB6gWdQgTJS0uSAhE437x64Si2H7YM5VkkSosAddJUICGshEo
 UjBw026tPzSLmnKGJgKAOz3XoXJd4c3LodT/qbL5b6dXL3etPKE5SIbU/QZz7GlUVWSLRcEMiqO
 Tnbd8nIcWFRD6/QWTrw==
X-Proofpoint-GUID: xQLapN87PO3DPAuCCvGufiOmqS2bmFkY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150142

On 26-09-14 03:12:29, Xin Liu wrote:
> On the Hamoa IoT EVK, each of the two existing PS8830 retimers has its
> own 25 MHz crystal wired to the retimer's XI/XO pins. The reference
> clock does not come from the PMIC, so the RPMH_RF_CLK4/5 references in
> the retimer nodes are wrong: they keep those RF clocks enabled for
> nothing and describe a connection that does not exist on the board.
> 
> Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
