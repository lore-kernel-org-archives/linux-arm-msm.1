Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492650;
	b=X5mwTg3QSP9Y6wH6I+DHaupfd75c8J9ccuhU6yL/+g4oTTrpUP2V7x3oHZAFdFI4a9n2
	 fRo5n6rYPF8Uvg519tqGub1tUna99b9TksuZAW/LgnwC73CEE11dMJrvZ/cSRrM+bBCme
	 nI3rT9Fg4mHZXlHnto8wrbkj20zST7+9WK/AzTqZ40Wb4UIKoaEjRjCW6br4xAWR4dYSH
	 D5TzCuYOzysg3m6JM1sJAH1j19RMpS9A6VlQS+C8hYRaovjnUWe9Wg9X1lzwCQ1EhFmzA
	 vx0/MNUHMNTMbrtAcJPevyj08wF0O6STgAnTSyZOBFzL2509qmn+m5Q3npmlTdSeDEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492650;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e4ZL0wK5kOGxE1Y7tPHBLyOAOezqxXQy3eNKnfQ9p0s=;
	b=0Buub0VjnEJbKTvOE34l7f4rzG3ufBLuzMcff7GVnp8yTyO2FNMZIYfmp1qtd8i6AP2z
	 Xw2Nq8VoSVbPIlzfvJEr7bVlWVJyAzVWxwiEQ5N5RRSHu7PceOOEfGcv9nwVB+DM/Nrp7
	 aeyW3PbOnYSJIN12kVrUEBLYX7b8YGYp9A21qB7nM1R2F5hP8b6B6ZOaR4Q5tDhT9RnhP
	 ctbIOKmw+c46L8ibE2NHbf3359B5dCHdQPvMI+UNbcIdkrmFXIRoA/o7R6JzY+EFes3Wf
	 WcT8ZbMMHCVGuJ9utWJ96ZsGQQrw3S/eSEV3pj08XK1rEjqC7xsaZmG57dVS8tFVtGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="G/B5sSIj";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L+PBBupv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48862606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 14:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48862606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G/B5sSIj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L+PBBupv
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAfO151954166
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 14:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e4ZL0wK5kOGxE1Y7tPHBLy
	OAOezqxXQy3eNKnfQ9p0s=; b=G/B5sSIjB1kFdW+mVxpGnL8eeJFe535kOxnL/j
	FBziMVmaz0o/uYGoKtlPQ7iPeRXFIFBMNYoLxlBeJF/1U2pSeuzeO7SSbA6zk4/r
	2Rx2LLjDYmg3Uk5CmOegz0SecOsPAbEmJG5AVkNcO5iq6e45q1oNWLxnhMo8mcmd
	uoCAyeW2SRrJ4CH2rhsWcVKcmU9dYlMd/b1ZituXlnOKObJT4wgDQwg3KGXAXSLs
	5evgP4CxR5207FguH8s0iY4wGihOB1RkDHLNSzksh0GMh/aZM9yzKooMgrMsztl9
	DKORxCGKj8iPBj4A4wM8Pf0R2ZzdLlsC5m57utaQekzZbtag==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx30pug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 14:10:49 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2e7fa9fbbso643968137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 06:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794492648; x=1795097448; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e4ZL0wK5kOGxE1Y7tPHBLyOAOezqxXQy3eNKnfQ9p0s=;
        b=L+PBBupv7q/VwjtYHy8kGcYH+vtKlRoySErz14m+W4byTOuW7Fss9t7EH0uv3Vscb0
         Mtl+29SI8p4/cWfslGNPyOzr0eN6PBV4Ol3KlwhDDLL8hwnIqH/HOs4xj0nmpQRwIhZl
         m0dvV1B6zKL0H1fQF/QpTVG4vKBbh/e3CsbwyQ3OotBLfc6BTt6qLNLU6rmlyNziyWC9
         ouqI48vhSD22yHckjz9Ix+5uEar+Cg9Y4ayHiJuvlZNM4rzWJAKwc4e8hrLe1ZIWrKp+
         O0P1Cc+4MRTWzQx1qCzYXF1zbKjUqMOeK0tqE4kk75MSiQwq1ORgO+C98iFdwkYYc3YT
         54ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492648; x=1795097448;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e4ZL0wK5kOGxE1Y7tPHBLyOAOezqxXQy3eNKnfQ9p0s=;
        b=VGAQ8bRJ8DDlJEumJDybWUkaTdvhDY4Ge4uG+fC6g8TpG+D3gj0C0nDcNLl1UjPnmV
         YGfbMlUa2roe44FeGzbuzho3gOLUSU/TN8upkPx6ttW+0Vgxjf7511cFLuuKn0n0VEYu
         eEL+vI73IzvVJsWlbGhuDMYKfqGknSJiO1fWv8l7REOt8960hQ2aRmhnR+zNyJ3dHLoj
         MS5ldICV44Cgf9dz/oLkmtzZLrFJhOD6aeKpwjR1WzMGMvhcxfTXGwJZYApnEMy9zapV
         lW9P9VlydGui8rzk7UKrGdcIHJQrVEi7bZD1PF1HSLlUwboCRVzgfqHWIkTgGFRYobkU
         Edrg==
X-Forwarded-Encrypted: i=1; AL+hErFqBNRmiQR8TOlJFbwiSBmYEDxDB7mrnGZ3Q3nLHNX7DHWVjmum0pL8ts28lDA0WJc94eCOxga2WJoSUfV0@vger.kernel.org
X-Gm-Message-State: APuU4Z9CRArcqaufrOWivTMOIxwQsbz8U8friMW0EfJn7kr7CmbZ29Qe
	c50qatQrvGIrRyFg7HWB68oZZAvoS2h3F+bS6pusOqe+oociAfZMbRuLQ9i2VHVRfmQeO605KAw
	Qodx67n0qqYRK93avSJTiq5P7QBJLW2oPRTIJCOE6Jb+hzqRk14CPHK0fjXMyBbktjvp8
X-Gm-Gg: AYBFou2LiSbbk2StArofEWJbzAGwLSxVO+MHTopMjDeZ6EVR+zIEEAEZx1MoE/+wGJq
	Mqu5FH8LcIOzbIqcOitoD6dvEmiXMZZotJ8Fj1iW55zGQUoiFzOQ4x/Ii4GttKNvj9529r3bdcJ
	xonmlWjAKS5GjWHcD9lsrxkEwZNBit7wVwPMfiV3wYL/OmaBGSBwULVRMIhg/lZDmRFlmx+JPs/
	liBcUR/7EgozewkoS1JOASMUZsGJoy7Zm/UHw1r0bL/o1WkwSQMiS/cN60mXDKP6fXz2NGi4lsa
	YoZs4ZM52tb8YR6HS4oI2IwvhRa3YsjvkdEhd+5SGJlN3D7tT/KqkwgDMidBxN+9nsQ7o45m/2Z
	TiQ5R8xTQbwqNITpex5122aFu1m3pMNl5tpf8/3eJn/ApZjZwqaPkNJM71wqd5OvB70dR3VAp2u
	EeTx8AYDZdwOio/Doxf6t1oAsiRE4WiE+EKxEGzhjpfwW//3ay18etcyyp57m9ZBI=
X-Received: by 2002:a05:6102:850b:20b0:7d6:4713:fbf1 with SMTP id ada2fe7eead31-7d64714075cmr111504137.44.1794492648126;
        Thu, 12 Nov 2026 06:10:48 -0800 (PST)
X-Received: by 2002:a05:6102:850b:20b0:7d6:4713:fbf1 with SMTP id ada2fe7eead31-7d64714075cmr111485137.44.1794492647559;
        Thu, 12 Nov 2026 06:10:47 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e271378sm81817775e9.13.2026.11.12.06.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:10:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v11 0/4] crypto: qce - Split the crypto driver into core
 and crypto parts
Date: Thu, 12 Nov 2026 15:10:40 +0100
Message-Id: <20261112-qce-fix-self-tests-v11-0-b86a65ee7107@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAODI9WoC/3XTS26DMBAA0KtErOvINv5GVdV7VF0Ye9ygEmgwQ
 ami3L0DaROkGhZI/vA8w4wvRYK+hlTsNpeih7FOddfigLGnTeH3rv0AUgecKDjliipGydEDifW
 ZJGgiGSANiQjLYwwcopWywA+/esAds/r2juN9nYau/54PGfk0+8fJHDdyQknwlrHInAuCv3Ypb
 Y8n1/jucNjiq5jUsVxKOiuVKIH3vBIBgo9hRRILifOsJFAS0WCiTjPl1YokH5KmKitJlIyKQrE
 YmeF2RVILaSU7NcUkpdYygozKr0j6Idl8AUeNkg9V4JoZF5lYkcxC4iwrGZQY1bLURlmn12pnl
 1L+j1uUKmwALTho6+KKxOidYpSVWQqzpkRi3bgrjZMyl9/11rg9HE94C4Zb9xaVS0CmTfWw27R
 wHsh8ED5Tox8gJTdfkd3m+XfhngwkUvXdJ7SkcRU0GMXU17qSlfWamhL+d+MLhnH9AacHJB+UA
 wAA
X-Change-ID: 20260610-qce-fix-self-tests-492ffd2ef955
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5205;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tY4wrzlPcMafKggMHvSTeinesaFJYvReG24LF7j+WIg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9cjkrOFV/ITcgwO7mekMv8N0hW8IWto+PxU0d
 f4VZIPyfRaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavXI5AAKCRAFnS7L/zaE
 w6ShD/sGfjkzjpSRkNbHcvSA3JV2p0q21D8lX86ZuGZm+//LyMBvw9OtxAFaKHJyd7VOYlOVkuW
 dH38ySYGISnTjwi1vbKhO6mnitS8ZMv2S0cdKDbzDvKhIw0Xqt7xR09qkHE3QslitQMp015mHpI
 icOu9rgCgCrNDWOtpcNNtx6zLNcai/uD+Ks5YHZkxcsrODIkUHzW+uBSj4MXY5IHvkpoYkiWrux
 BdueoWIAYr4zQStDsV5v4OUKz3QAjZEAO6Gy5TBMMOFkxxwQkhMpFu2vGi5HKm7WG+61cTSlptP
 lUJjT2uqY7XFfAkF+AtVUy/aUT79D+aD9ukXHnEkrK7SindPJHvuyXga2isOkmYYQH2KEu0Z9DH
 hQfGEQUS8mqZ3+c4hn4YjVtwr89rIEzJx5i+nF+wo6eSWi1mCa/ZrClcryiPvGUPN5r1xwwNYgF
 ScgUv2/0C/gn2nBHJojt41UT+EiVXF7dWLzs46WWNJC28414xFCzPQ2w+nMQa/W3knvMOP3uuH1
 tlsDKCKUGxlODPZsYlhwMDKKLFttTLp+bJ92ZI8Ih2Y3QxB4HdEKv4hAmG5JeckercKctKXhmiV
 swOFgQwIhilb2OjQT0+csyTazYjYKs3MUjvhhXr0jVoDEy4j1ZYor+7YL9pkXvqJW1czmwiYHBN
 LVLOO9GDizftAGA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5c8e9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=mX25IeO7DPU1pHUkNG0A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX/jEUxAWp//Hy
 jpYtF43evaNjC9KpN8+x22z9cXJcGJqL79k9uBRHn7Qzi+zGzl6e0onMlEmuBsUKFgfWK36WGVO
 uOANxINeQmQXlQzzhYXrGKb23Oxadc0J54MxDw+SoUw2lsemyHV6Q5jU57dND7TIUXbUlNtUPo9
 Eb9IaD82LqZMZmMFUexen2NAJ6KrT87o+vzloUSqZQHW/iNyL7dfvc90XLj6SJ++pW04cvGvFj+
 EGeChdNKkicWFCG5wJl2E2Rc6/z4Z7+lHSIYLZM60vYyBwr9SbBO6mVgk8mmAvpxoUkpHHjZ8pT
 gg2cI1go0Hx37r6eoVu6xJEWmWfO4IMMM0I9q8r/r324JiVJxBjka4B6Tai8Keksu4eaTDgoBA9
 oQipNP9Rqu5z+9Jls9JGrzl3EaT/r3QDyDAqVpLYBCDBvK6605MCOlZ4WwEOqaoG48cUCwLoh6/
 nOv34rdsOPG0ZxYc6tA==
X-Proofpoint-ORIG-GUID: GYNX7iOyy-nDxdCNZGg_ELUBULZ5w-_E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX32m53JtEvI1x
 fC3qOGxfm4uKsp1aSOJxfyo7lnAhzZOZFamEhVykL3+X60oVG5UzXLfPjAnEabFZ0zyrVBtsGw0
 IU3k6YxVHj9d1KCRuwWF39eLUR76Qz8=
X-Proofpoint-GUID: GYNX7iOyy-nDxdCNZGg_ELUBULZ5w-_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120056

With the self-tests fixes queued, we can now split the QCE driver into
the core part necessary to bind to the QCE DT node and enable runtime
power management in order to allow to drop the interconnect votes, and
the crypto part registering the crypto algorithms. The core module is
then enabled in arm64 defconfig while the crypto part stays disabled by
default. 

Merging: Once the fixes to self-tests land in mainline, this series
should be queued through the crypto tree with an immutable branch
provided to ARM-SoC and SoC driver trees (with Acks from SoC
maintainers).

This depends on the final series with fixes for the QCE driver:
  https://lore.kernel.org/all/20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v11:
- Rebase on top of fixes queued upstream
- Drop Tested-by tags from defconfig patches
- Tweak commit messages for defconfig patches
- Link to v10: https://patch.msgid.link/20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com

Changes in v10:
- don't pass a NULL buffer to sg_init_one()
- fix byte order of the imported hash state on empty finalization
- don't recompute the CTR counter in software for every request
- reject skcipher requests with a too short scatterlist
- check fragmentation for empty CCM decryption requests too
- don't use a static loop iterator (duh...)
- initialize the return value in qce_handle_queue()
- Link to v9: https://patch.msgid.link/20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com

Changes in v9:
- Rebase on top of cryptodev/master
- Rephrase Kconfig help text changes
- Link to v8: https://patch.msgid.link/20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com

Changes in v8:
- Add a patch making the crypto driver *not* register algos by default
  but only if the user explicitly requests it with the provided module
  parameter
- Use the "offloader" name for the crypto IP instead of "accelerator"
- Fix device module table issues
- Make the core driver use a list (despite it only having a single
  member now) of child auxiliary devices to register to make it clear we
  have the intention of extending this once we start the work on secure
  media playback
- Link to v7: https://patch.msgid.link/20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com

Changes in v7:
- Add follow-up changes converting the QCE crypto driver to auxiliary
  bus, adding the core QCE driver under drivers/soc/ registering the
  auxiliary device and removing the BROKEN Kconfig label
- Link to v6: https://patch.msgid.link/20260717-qce-fix-self-tests-v6-0-455775fe5f6c@oss.qualcomm.com

Changes in v6:
- Handle all zero-length HMAC finalizations (like imported state with
  data already hashed), not only the genuinely empty message case
- Add an additional patch addressing the fragmented skcipher payload
  issue
- Link to v5: https://patch.msgid.link/20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com

Changes in v5:
- Dropped patch 1/8 that's already queued
- Use the pre-allocated fallback ahash for HMAC transforms (Herbert)
- Link to v4: https://patch.msgid.link/20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com

Changes in v4:
- Remove remaining ECB and DES3 bits
- Pick up tags
- Link to v3: https://patch.msgid.link/20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com

Changes in v3:
- Remove even more algorithms and dead code in patch 1/8
- Link to v2: https://patch.msgid.link/20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com

Changes in v2:
- Add fixes for the full suite of crypto self-tests
- Add Fixes and Cc tags
- Link to v1: https://patch.msgid.link/20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com/

---
Bartosz Golaszewski (4):
      crypto: qce - convert to auxiliary bus
      soc: qcom: add core driver for the Qualcomm Crypto Engine
      arm64: defconfig: update the Qualcomm Crypto Engine entry
      arm: multi_v7_defconfig: update the Qualcomm Crypto Engine entry

 arch/arm/configs/multi_v7_defconfig |  2 +-
 arch/arm64/configs/defconfig        |  2 +-
 drivers/crypto/Kconfig              |  2 +
 drivers/crypto/qce/aead.c           | 12 ++---
 drivers/crypto/qce/core.c           | 95 +++++++++++++++++--------------------
 drivers/crypto/qce/core.h           |  5 +-
 drivers/crypto/qce/sha.c            | 12 ++---
 drivers/crypto/qce/skcipher.c       | 12 ++---
 drivers/soc/qcom/Kconfig            | 11 +++++
 drivers/soc/qcom/Makefile           |  1 +
 drivers/soc/qcom/qce-core.c         | 92 +++++++++++++++++++++++++++++++++++
 11 files changed, 173 insertions(+), 73 deletions(-)
---
base-commit: 6aa7dbf8ad5ebd3babf53a4d6209018f86939f17
change-id: 20260610-qce-fix-self-tests-492ffd2ef955
prerequisite-message-id: <20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com>
prerequisite-patch-id: 06a8db6bb7eee2d6c76312712f089686b15a7fb5
prerequisite-patch-id: c055978d60dd6978c60ea2bbf94256ab2741fc46

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

