Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625398;
	b=W+aUbsG39OGNDO3tCKTsXqawQEXtDcnCTlppcKiXNcGZkfKhmwKAjCbdIRbwI4zleNpK
	 aYkenWi5C3lDY35cmC4bHkcYP/tFPqhplbF0YP4MZxN34PfSbPr+1Uyp9cKAoCHDZw3sl
	 HFYe98aBD4cH+B7KHn4mtMXYxTxupO9/wpXAl7cJJz2yUw4C0V/NWfqvt+6pS4f52rnjy
	 iaqj1kMqwGEjnQ9LZ7l3fuX64mXj0SxpE023/H6fH7jHxn+Av9KW+8Xk08ueWmXL/lfxJ
	 vOyE7QS57GypmBmlJoGWt8HZFhWzuvCgxA9bMKDspihEHCANkRxh0e+1C74kqDUTRfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625398;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZPOKcmL7lQy+qX98/Hb5eqt195myTo3bkucqsGDDuBU=;
	b=YKishs4gmh8Oy2IgWksN1M5zdvwR8JWKwwa69slFJoM9n0qY5bem7RAMQQqFE57hij4I
	 YPtfc7fvRVtXJ2tAIUTAaUSIwjpp53EazRLL/cR+uwY/nFzH27oJ0rk1ORlWb+ypNeB8v
	 jM0Fw7NpDqzBl4td4hKv5qtYG5n//opIqY/NtOP40YLpLWIyRVAFmF1+sYNXp+wGi139P
	 21eukZfXgCBRUSp+pynzpBt0HEmxWA7+RBJ61S93DlcYjskEeE9IYHML1K0dfooRvqfo4
	 mtF+fOTOWlW2kQYHkmCToHQOuJY7zekYI12CfL57ts1s98r8CJODuQfinzo/XfYzV+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMVlKM+t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUHL740x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CD7606A339
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17CD7606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMVlKM+t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUHL740x
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAmBr3627768
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZPOKcmL7lQy+qX98/Hb5eqt1
	95myTo3bkucqsGDDuBU=; b=oMVlKM+txmsHATfXRPiim56eCDEfI+ZgkOtJuaJ2
	iTsntX7oFB6cSpMYi7MtzOCmCAeZLp2Hk2eBMsHZ3G/JnBH4KS3yYUJbhmZnrwfl
	d3QOJJEVWQxYAg8Vp5b5Uy5Z+ZXOxPJifX53lj7l8s/JCntTvwaLifhzlXj/4apW
	l4Vn/BGBjO53mqh+ajkMYw6hGjWlfMAv1C7Pq0jqMhXrGspckrunNpWX/HAdfQVt
	An8GBY6IMkPq4vQi8bW4uufTT9Vukq+OijJLvF5/XZ2LfgMMqWqdW1Z1OAkfxqf5
	Umkt/9lAOMz+9/jqba3vznXXVti8oS17m2z8hOq6M7lZZw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61xus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:16:36 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc175cb172so2638961137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625396; x=1794230196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZPOKcmL7lQy+qX98/Hb5eqt195myTo3bkucqsGDDuBU=;
        b=VUHL740xVKyaiN991FpboDe4EtCVSpoWkTrmPYbIgKR6r2lViU2mOyy5QR6kuga5sO
         fFB8Zt0sPpOfU+jzLn/Imgheu6SoVfQckWgaraM6BJMTppiO9WA6ScZfqQ4oH77Z9DKe
         ttxTv7UmmHQf6sx3XlJ+eiR9h6FxGa3NAMu8N9Sp26fl1Lbx20Ztfw9CPgIxG3oKkSrT
         M4P1IiADRcKlSy5ijBWaBTXNMXEr1mYy7t0JI08RJfuok7FrSUxTT8SbUfz6Ijt/wi9/
         uWHsb05m8B+9iX7ROJSB2YFRAk9yrh9pGOkgFz2n7/vXrks2jSXB+varrbJy4+ALawIC
         RawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625396; x=1794230196;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZPOKcmL7lQy+qX98/Hb5eqt195myTo3bkucqsGDDuBU=;
        b=PPB7uqNR3n3H4xtuWoKSm/mpXXBH3eeS9+9dJnrd8+qEtqC9/O1YHT9DK42CL6Lwn9
         0xUt3OwU8vQrKOC808Ge5hQ5Th0oLyUpnQ60ekcdrOBj9H81dIAPHOyrY01LXfUDf8pD
         P2EL1xqTXAC+mhvOo1VHo3DGWvumeYNYONzCthRDXPC7Q+xHC8B+cn6xSBkli3M7jczG
         smKNtCoIbtQ/1TfL7HArLw8t/COdyHfCy68ZRGXY03xrH23e4sf7hqdEKGraRbpZIDFn
         Ktf4tiyQ9CSUGOyTXxG1FOFlDcycsr84VIaPFPqsYvdKdv7A+v001DicCJjxO2jtSmif
         d1YQ==
X-Forwarded-Encrypted: i=1; AKwUvBwI1ued/HX7pe6r73xLAHHw1RdmWpMwKVi9cMiTH3MeotPp+q00OqeBsGKKEKMsIg1Y0vEy2i7zPMgU4veC@vger.kernel.org
X-Gm-Message-State: APuU4Z8xdeEEbvfKlGpZLODo4bb5Mjz8D7goPB+LHrSsTE2zszjDUt+f
	xDLuLey5g3HfUXDNRxTO7Xfj0DwgvS1yFnpDICCpJpCsU4pPCKS8Ac57gUDdVjUopgWbgaeelPU
	B2q/ZR+bWclED3LJvGzdjSRa8LOATbEm+Wq265rv+rAPztINNzUm1JQ6yvuYcUYxAK3Ug
X-Gm-Gg: AYBFou1mHWDNEMRXHV0t2P53+B5XOIN+dWhyX2wyBDdnPqnfsbhsvYulNWVZTKTy4bG
	li0kbFG6jr0K0CyQZg4ElLtmkoShfBdqoZbMbrIdUDgvLqlE6fm4etgp3f4xEKc8n7xKRGbZvPD
	55xis6IWTWkjPzjSYyhWybsU7dfmQy+R2CDCMqnhdC4nSk7yjUU6Pin3e/uKIEzGkQYrRGpk142
	xbU68npkV+NIovjVLYWnikmNA0NO2NdU4gKf3/cdU+twOZgDswInLh/rdxwD9eUld+eOO0lEcOa
	9STV8eIK5zQXxuXwRqcVpurKuFV/LwGwRVx1EYEevuOFjkrqoGBNM82FcFM5flYpw/rHuauw/Ge
	hEQuCPfaGy6ZBDbUzxZRWIa9aHaZXSMVzmMUpFBOeC+AVnEhlsRqgVAtcznQWri0=
X-Received: by 2002:a05:6102:3f44:b0:7cc:24e1:77b with SMTP id ada2fe7eead31-7d072270da8mr3880615137.4.1793625396100;
        Mon, 02 Nov 2026 05:16:36 -0800 (PST)
X-Received: by 2002:a05:6102:3f44:b0:7cc:24e1:77b with SMTP id ada2fe7eead31-7d072270da8mr3880604137.4.1793625395532;
        Mon, 02 Nov 2026 05:16:35 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm388764885e9.11.2026.11.02.05.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:16:34 -0800 (PST)
Date: Mon, 2 Nov 2026 15:16:33 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 7/7] arm64: dts: qcom: nord-rrd: Add WCN7850
 Bluetooth support
Message-ID: <mlbqkhcqfiyajecqwh5evllyq5bc3d7fgyf7lhcdkeq376lz5r@ekmvrkztgkvt>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
 <20261031142433.1212809-8-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261031142433.1212809-8-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: h4tBCE5kRqpmbrXmPQG9Car7UFb6Z1dW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfXz40y7aX0EdYN
 cHginZCKpPOfA1QOWT1cGAMzwgZpSJn1YYM/cm3RGFvQgytXydHJzhBMzqC0YLHIc2reHM1e8z2
 vxdf5/nTgucvhe+etr74AlhjS3nM7Ls=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae88d34 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=MF1Hv_S4EHO9a51YHiAA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX7SYgau1wADY+
 oXgYcsJcOKMZ4KBLJwtNu7fkc0h6G2CLN0vcn2n8WuoHrO8sJYdXhMHGwRcJz0ypXQwyWeIPkPS
 XvWoG7OGp49KkYWnnJd8M4iPZsJrVtLjq6/pHJOyB2wG9C0zgAywRlaltffRfo4xsdDpgm0/UDs
 FEqvAqH7LT/vYCDb+ExIMNIwf5lAMadKnBJ/W+vryFFIx0EVHMiX/87GSEF59bmIpqYyryDhBN1
 xrgW8ceuAY4kU1g3j0GZpNQ70oPvPJTptpUn1I6G60efptXUkOwdOawvDBe4d25FKr+CGid5oEy
 fjip4e+WY3GeXMu9iLUMh/ueYS6f7ED/BWsgJQ8ZBkRsiKdSGdtfqDpE9NeyE8kQI7GJKXcb0jT
 zBlVwt1UcuvT+/hWXPsC5t/N5mAA/C9ZHZGD91WaAbu41ISn/6Rw2vQVdZxEk9bQAYwH5SMTlfX
 rkfs6n3PYVtQprpmDow==
X-Proofpoint-GUID: h4tBCE5kRqpmbrXmPQG9Car7UFb6Z1dW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020052

On 26-10-31 22:24:33, Shawn Guo wrote:
> From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> 
> Enable Bluetooth for the WCN7850 module on the Nord RRD: route the
> BT UART (uart17) as serial1, add the bt-enable GPIO (pmau0102_e GPIO9)
> to the WCN7850 PMU and describe the bluetooth node with its supplies.
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
